class Api::V1::MoviesController < ApplicationController
  respond_to :json, :html
  
  # def index
  #   movies = current_user.movies.order(:title)
  #   render json: movies
  # end
  
  # def show
  #   respond_with Movie.find_by(id: params[:id])
  # end
  
  def update
    movie = Movie.find(params[:id])
    if movie.update(movie_params)
      render json: movie
    else 
      render :json => { :errors => movie.errors.full_messages }, :status => 422
    end
  end
  
  # def create
  #   movie = Movie.new(movie_params)
  #   if movie.save
  #     render json: movie
  #   else 
  #     render :json => { :errors => movie.errors.full_messages }, :status => 422
  #   end
  # end
  
  # def destroy
  #   respond_with Movie.destroy(params[:id])
  # end
  # 
  private
  
    def movie_params
      params.permit(:title, :watched, :note, :id, :user_id)
    end
end