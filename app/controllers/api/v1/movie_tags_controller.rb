class Api::V1::MovieTagsController < ApplicationController
  def destroy
    movie_tag = MovieTag.find(params[:id])
    if movie_tag.destroy
      render json: {message: "deleted"}
    end
  end
end