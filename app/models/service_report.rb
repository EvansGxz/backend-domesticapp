class ServiceReport < ApplicationRecord
  belongs_to :order_dtail
  has_one_attached :cover
end
