class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @appointments = @user.appointments.where(complete: false)
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Thanks #{user.name}. Your account was successfully created"
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash[:alert] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
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