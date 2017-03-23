class YelpSearchResultsTest < Minitest::Test
  def test_assumed_url_for_first_structure_still_valid
    results = YelpSearchResults.new("spotted pig", "New York, NY")
    expected_url = "/biz/the-spotted-pig-new-york"

    assert_equal expected_url, results.url_for_first
  end
end
