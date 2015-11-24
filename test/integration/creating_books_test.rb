 # TODO: find about about resource.location error
require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest
  test 'creates new books with valid data' do
    post '/api/books', { book: {
        title: 'PG',
        rating: 5,
        author: 'DT',
        genre_id: 1,
        review: 'great book',
        amazon_id: 'sdsd567'
      }}.to_json,
      { 'Accept' => 'application/json',
        'Content-Type' => 'application/json' }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    book = json(response.body)
    assert_equal api_book_url(book[:id]), response.location

    assert_equal 'PG', book[:title]
    assert_equal 5, book[:rating].to_i
    assert_equal 'DT', book[:author]
    assert_equal 1, book[:genre_id].to_i
    assert_equal 'great book', book[:review]
    assert_equal 'sdsd567', book[:amazon_id]
  end

  test 'does not create books with invalid data' do
    post '/api/books', { book: {
        title: nil,
        rating: 5
      }}.to_json,
      { 'Accept' => 'application/json',
        'Content-Type' => 'application/json' }

    assert_equal 422, response.status
  end
end
