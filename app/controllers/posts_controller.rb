class PostsController < ApplicationController
  before_action :set_post, only:[:show, :edit, :update, :destroy]

  PER = 20

  def index
    @posts = Post.page(params[:page]).per(PER)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def show
    client = Twitter::REST::Client.new do |config|
      # 事前準備で取得したキーのセット
      config.consumer_key         = "UPcnTR1QtCePddkiKYAcOdzBI"
      config.consumer_secret      = "NMMBD5drfR7kORj3wYWGJehDosut1s11KlO1v6be4aAxMsGh1L"
    end
    @comment = Comment.new
    @xxx = @post.comments
    @aaa = @xxx.each do |a|
              a.talk
    end
    if @aaa.first.present?
      if @aaa.first.talk.length >= 10 && @aaa.first.talk.length <= 15
        @result_tweets1 = client.search(@aaa.first.talk, count: 25, result_type: "recent", exclude: "retweets" )
      end
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def google_map
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title)
  end

end
