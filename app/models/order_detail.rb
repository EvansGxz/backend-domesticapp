class OrderDetail < ApplicationRecord
  belongs_to :category
  belongs_to :employee
  belongs_to :customer
end
