require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  setup do
    Book.create!(title: 'PP', rating: 5)
    Book.create!(title: 'EG', rating: 4)
  end

  test 'listing books' do
    get '/books'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal 2, json(response.body)[:books].size
  end

  test 'lists top rated books' do
    get '/books?rating=5'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal 1, json(response.body)[:books].size
  end
end
