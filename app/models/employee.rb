class Employee < ApplicationRecord
  belongs_to :user

  has_one_attached :cover
  has_one_attached :contrato

  def image_url
    Rails.application.routes.url_helpers.url_for(cover) if cover.attached?
  end
end
