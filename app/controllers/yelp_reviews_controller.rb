class YelpReviewsController < ApplicationController
  def index
    business = 1
    render 'index', locals: {business: business}
  end

  def search
    count = params[:reviews][:count]
    name = params[:restaurant_name]

    redirect_to root_path count: count, restaurant_name: name
  end
end
