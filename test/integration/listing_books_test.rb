require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  setup do
    @scifi = Genre.create!(name: 'Science Fiction')
    @programming = Genre.create!(name: 'Programming')
    @programming.books.create!(title: 'PP', rating: 5)
    @scifi.books.create!(title: 'EG', rating: 4)
  end

  test 'listing books' do
    get '/api/books'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    books = json(response.body)
    assert_equal 2, books.size
  end

  test 'lists top rated books' do
    get '/api/books?rating=5'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal 1, json(response.body).size
  end
end
