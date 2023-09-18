class LoanSerializer < ActiveModel::Serializer
  attributes :id, :book, :user, :return_date, :returned
end
