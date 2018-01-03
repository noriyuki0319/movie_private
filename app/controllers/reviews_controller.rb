class ReviewsController < ApplicationController
  before_action :set_review, only:[:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to movie_review_path(@review.movie_id, @review.id)
    else
      redirect_to new_movie_review_path(@review.movie_id)
    end
  end

  def show
    @movie = Movie.find(params[:movie_id])
  end

  def edit
  end

  def update
    @review.update(review_params_update)
    redirect_to movie_review_path(@review.movie_id, @review.id)
  end

  def destroy
    @review.destroy
    redirect_to user_path(@review.user_id)
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:review, :rating, :nickname, :track_id).merge(movie_id: params[:movie_id])
  end

  def review_params_update
    params.require(:review).permit(:review, :rating, :nickname, :track_id, :movie_id)
  end

end
