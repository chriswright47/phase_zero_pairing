class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    path = user.save ? home_path : new_user_path
    redirect_to path
  end

  def edit

  end

  def update

  end

  def delete
    User.find(params[:id]).destroy
    redirect_to home_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end