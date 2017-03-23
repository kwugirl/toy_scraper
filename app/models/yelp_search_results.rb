class YelpSearchResults
  def initialize(search_term, location)
    @search_term = search_term
    @location = location
  end

  def url_for_first
    get.first.attributes["href"].value
  end

  private

  def get
    @options = {query: {find_loc: @location, find_desc: @search_term},
                headers: {"User-Agent": "ToyApp"}}

    page = HTTParty.get("https://www.yelp.com/search", @options)
    Nokogiri::HTML(page).css('div.biz-listing-large span.indexed-biz-name a.biz-name')
  end
end
