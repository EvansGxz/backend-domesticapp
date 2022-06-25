class EmployeeCategory < ApplicationRecord
  belongs_to :category
  belongs_to :employee
  belongs_to :user
  has_many :favorites, dependent: :destroy
end
