class EmployeeCategory < ApplicationRecord
  belongs_to :category
  belongs_to :employee
  
  has_many :favorites, dependent: :destroy
end
