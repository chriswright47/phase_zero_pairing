class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.find_by_email(params[:email])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        path = home_path
      else
        flash[:alert] = 'password was invalid'
        path = new_session_path
      end
    else
      flash[:alert] = 'email was not found'
      path = new_session_path
    end
    redirect_to path
  end

  def delete
    session.clear
  end
end