class Admin < ApplicationRecord
  belongs_to :user
  has_one_attached :cover

  # Enumerators
  enum :role, { admin: 1, mod: 0, spectator: 2 }

  def image_url
    Rails.application.routes.url_helpers.url_for(cover) if cover.attached?
  end
end
