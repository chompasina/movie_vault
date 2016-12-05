class SessionsController < ApplicationController

  def new
  end
  
  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        flash[:success] = "Hi, #{current_user.username}"
        redirect_to root_path
    else
      flash[:danger] = "Invalid credentials. Please try again."
      redirect_to login_path
    end
  end
  
  def destroy
    session.clear
    flash[:success] = "Goodbye!"
    redirect_to root_path
  end
end