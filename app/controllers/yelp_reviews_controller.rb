class YelpReviewsController < ApplicationController
  def index
    render 'index'
  end

  def search
    count = params[:reviews][:count]
    name = params[:restaurant_name]

    redirect_to root_path count: count, restaurant_name: name
  end
end
