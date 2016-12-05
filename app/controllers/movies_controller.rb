class MoviesController < ApplicationController
  def index
    if(!current_user)
      redirect_to login_path
    else 
      @movies = Movie.where(user_id: current_user.id)
    end
  end
end