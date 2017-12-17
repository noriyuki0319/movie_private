class UsersController < ApplicationController
  def index
    @xxx = Movie.where(user_id: current_user.id)
    @recommend = @xxx.order("RANDOM()").first
      @recommend1 = ITunesSearchAPI.search(
        :term => @recommend.director,
        :country => 'jp',
        :media => 'movie',
        :lang => 'ja_jp',
        :limit => '3')
  end


  def show
    @user = User.find(params[:id])
  end

  def destroy
  	@user.destroy
    redirect_to movies_path
  end
end
