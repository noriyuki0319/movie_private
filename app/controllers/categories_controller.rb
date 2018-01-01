class CategoriesController < ApplicationController

  def index
  end

  def categories_list
    @category = Movie.joins(:reviews).where(category_id: params[:keyword]).group("track_id")
  end

end
