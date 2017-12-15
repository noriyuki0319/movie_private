class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  	@user.destroy
    redirect_to movies_path
  end
end
