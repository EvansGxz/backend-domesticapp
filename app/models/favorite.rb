class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :employee_category
end
