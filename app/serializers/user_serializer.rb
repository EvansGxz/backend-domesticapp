class UserSerializer < ActiveModel::Serializer
  has_one :employee
  has_one :customer
  has_one :admin
end
