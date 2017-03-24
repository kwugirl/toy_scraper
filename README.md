# README

YelpReviewScraper is a primitive review aggregator. Given some search criteria
and a number `n` between 1-9 (inclusive), it loads the business listing for
the first search result and calculates the average rating across the `n` most
recent reviews.

To run this app, `bundle install`, start the server (`bundle exec rails s`),
and visit http://localhost:3000/.

The main pieces beyond the initial Rails setup are:
* YelpReviewsController
* YelpSearchResults model: covers running the broad initial search and getting
the URL for the first result
* YelpBusiness model: covers fetching the business' listing and its most recent reviews
