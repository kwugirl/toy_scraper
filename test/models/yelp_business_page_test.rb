require 'mocha/mini_test'

class YelpBusinessPageTest < Minitest::Test
  def test_calculate_avg_rating_across
    page = YelpBusinessPage.new('/biz/some_biz')

    ratings = [1, 3, 5]
    page.stubs(:recent_reviews).returns(["some", "reviews"])
    page.stubs(:ratings_from).returns(ratings)

    expected = 3.0

    assert_equal expected, page.avg_rating_across(3)
  end
end
