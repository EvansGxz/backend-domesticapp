class Employee < ApplicationRecord
  belongs_to :user
  has_many :employee_categories, dependent: :destroy
  has_many :hability_employees, dependent: :destroy
  has_one_attached :cover
  has_one_attached :contrato
  has_many :reviews, dependent: :destroy
  def image_url
    Rails.application.routes.url_helpers.url_for(cover) if cover.attached?
  end
end
