class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :editorial, :available, :loans
end
