class MoviesController < ApplicationController
  before_action :set_movie, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only:[:edit, :update]

  def index
    if params[:keyword].present?
      @searches = ITunesSearchAPI.search(
        :term => params[:keyword],
        :country => 'jp',
        :media => 'movie',
        :lang => 'ja_jp',
        :limit => '10')
    end
  end

  def new
    @search = ITunesSearchAPI.search(
        :term => params[:keyword],
        :country => 'jp',
        :media => 'movie',
        :lang => 'ja_jp',
        :limit => '10')
    @movie = Movie.new
  end

  def search
      client = Twitter::REST::Client.new do |config|
      # 事前準備で取得したキーのセット
      config.consumer_key         = "UPcnTR1QtCePddkiKYAcOdzBI"
      config.consumer_secret      = "NMMBD5drfR7kORj3wYWGJehDosut1s11KlO1v6be4aAxMsGh1L"
    end
    if params[:keyword].present?
      # リツイートを除く、検索ワードにひっかかった最新10件のツイートを取得する
      @result_tweets = client.search(params[:keyword], count: 10, result_type: "recent", exclude: "retweets" )
    end
  end

  def show
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    @movie.save
    redirect_to movie_path(@movie.id)
  end

  def update
    @movie.update(movie_params)
    redirect_to movies_path
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:image, :title, :director, :staff, :information, :time, :category_id, :user_id )
  end

  def correct_user
    movie = Movie.find(params[:id])
    if current_user.id != movie.user.id
      redirect_to root/path
    end
  end

end
