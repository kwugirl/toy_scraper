require 'mocha/mini_test'

class YelpBusinessTest < Minitest::Test
  def test_calculate_avg_rating_across
    business = YelpBusiness.new('/biz/some_biz')

    ratings = [1, 3, 5]
    business.stubs(:recent_reviews).returns(["some", "reviews"])
    business.stubs(:ratings_from).returns(ratings)

    expected = 3.0

    assert_equal expected, business.avg_rating_across(3)
  end
end
