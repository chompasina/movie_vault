class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Your account was successfully created, #{@user.username}"
      redirect_to movies_path
    else 
      flash.now[:warning] = @user.errors.full_messages.join(", ")
      render :new
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :email)
    end
end