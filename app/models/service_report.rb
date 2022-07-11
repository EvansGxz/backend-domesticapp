class ServiceReport < ApplicationRecord
  belongs_to :order_dtail
  has_one_attached :cover

  def image_url
    Rails.application.routes.url_helpers.url_for(cover) if cover.attached?
  end
end
