class UserSerializer < ActiveModel::Serializer
  attributes :id, :identification, :name, :address, :email, :phone, :loans
end
