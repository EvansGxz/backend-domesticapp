class Hability < ApplicationRecord
  has_one_attached :image
  has_one :hability_employee, dependent: :destroy


  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
