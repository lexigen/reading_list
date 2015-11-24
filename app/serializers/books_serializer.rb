class BooksSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating
end
