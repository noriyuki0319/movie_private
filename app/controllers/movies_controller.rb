class MoviesController < ApplicationController
  before_action :set_movie, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only:[:edit, :update]

  def index
    if params[:keyword].present?


      # Amazon::Ecs::Responceオブジェクトの取得
      @movies = ITunesSearchAPI.search(
        :term => params[:keyword],
        :country => 'jp',
        :media => 'movie',
        :lang => 'ja_jp',
        :limit => '10')
    end
  end

  def show
  end

  def edit
  end

  def new
    @movie = Movie.new
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
    params.require(:movie).permit(:image, :title, :director, :staff, :information, :time, :category_id, :user_id)
  end

  def correct_user
    movie = Movie.find(params[:id])
    if current_user.id != movie.user.id
      redirect_to root/path
    end
  end

end
