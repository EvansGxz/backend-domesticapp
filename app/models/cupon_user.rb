class CuponUser < ApplicationRecord
  belongs_to :cupon
  belongs_to :customer
end
