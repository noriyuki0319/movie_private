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
    @review.save
    redirect_to movie_path(@review.movie_id)
  end

  def show
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to review_path(@review.id)
  end

  def destroy
    @review.destroy
    redirect_to movie_path(@review.movie_id)
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:review, :rating, :nickname).merge(movie_id: params[:movie_id])
  end

end
