class YelpBusiness
  attr_reader :url

  def initialize(relative_url)
    @url = "https://www.yelp.com#{relative_url}"
  end

  def name
    @name ||= extract_name
  end

  def avg_rating_across(count)
    reviews = recent_reviews(count)
    ratings = ratings_from(reviews)

    (ratings.sum/ratings.count).round(1)
  end

  private

  def page
    @page ||= begin
      @options = {query: {sort_by: "date_desc"}, headers: {"User-Agent": "ToyApp"}}
      page = HTTParty.get(@url, @options)
      Nokogiri::HTML(page)
    end
  end

  def extract_name
    page.css('h1.biz-page-title').first.children.first.text.strip
  end

  def recent_reviews(count)
    page.css('div.review--with-sidebar div.rating-large')[0...count]
  end

  def ratings_from(reviews)
    reviews.map {|review| review.attributes["title"].value[0].to_f}
  end
end
