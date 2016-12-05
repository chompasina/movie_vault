class MoviesController < ApplicationController
  def index
    if(!current_user)
      redirect_to login_path
    else 
      @movies = Movie.where(user_id: current_user.id)
    end
  end
  
  def new
    @movie = Movie.new
  end
  
  def create
    @movie = current_user.movies.new(movie_params)
    if @movie.save
      flash[:success] = "Movie added."
      redirect_to movies_path
    else
      flash[:danger] = @movie.errors.full_messages.join(", ")
      redirect_to movies_path
    end
  end
  
  private
  
    def movie_params
      params.require(:movie).permit(:title, :note)
    end
end