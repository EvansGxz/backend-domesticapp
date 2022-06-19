class Service < ApplicationRecord
  belongs_to :category
  has_one_attached :service_avatar
end
