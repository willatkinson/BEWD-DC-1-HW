class SearchController < ApplicationController

  def index
    query = params[:q]
    @movies = Movie.where('title LIKE :query OR description LIKE :query OR year_released LIKE :query', query: "%#{query}%")
  end

end
