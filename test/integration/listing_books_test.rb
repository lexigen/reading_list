require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  setup do
    Book.create!(title: 'PP', rating: 5)
    Book.create!(title: 'EG', rating: 5)
  end

  test 'listing books' do
    get '/books'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal Book.count, JSON.parse(response.body).size
  end
end
