class EmployeeCategory < ApplicationRecord
  belongs_to :category
  belongs_to :employee

  has_many :reviews, dependent: :destroy
end
