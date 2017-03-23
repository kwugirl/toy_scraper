class YelpBusinessPage
  def initialize(relative_url)
    @relative_url = relative_url
  end

  def avg_rating_across(count)
    reviews = recent_reviews(count)
    ratings = ratings_from(reviews)

    (ratings.sum/ratings.count).round(1)
  end

  private

  def recent_reviews(count)
    @options = {query: {sort_by: "date_desc"},
                headers: {"User-Agent": "ToyApp"}}

    page = HTTParty.get("https://www.yelp.com#{@relative_url}", @options)
    Nokogiri::HTML(page).css('div.review--with-sidebar div.rating-large')[0...count]
  end

  def ratings_from(reviews)
    reviews.map {|review| review.attributes["title"].value[0].to_f}
  end
end
