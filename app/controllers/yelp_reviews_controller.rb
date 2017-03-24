class YelpReviewsController < ApplicationController
  def index
    business = nil
    if params[:biz_url] && params[:count]
      business = YelpBusiness.new(params[:biz_url])
      count = params[:count].to_i
    end

    render 'index', locals: {business: business, count: count}
  end

  def search
    count = params[:reviews][:count]
    name = params[:restaurant_name]
    location = "New York, NY"

    biz_url = YelpSearchResults.new(name, location).url_for_first

    redirect_to root_path biz_url: biz_url, count: count
  end
end
