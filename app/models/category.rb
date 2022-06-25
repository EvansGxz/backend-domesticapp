class Category < ApplicationRecord
  has_one_attached :image

  has_many :employee_categories, dependent: :destroy
  belongs_to :sector

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
