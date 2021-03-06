class Customer < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :cupon_users, dependent: :destroy
  has_many :customer_notifications, dependent: :destroy
  has_one_attached :cover

  def image_url
    Rails.application.routes.url_helpers.url_for(cover) if cover.attached?
  end
end
