class HabilityEmployee < ApplicationRecord
  belongs_to :hability
  belongs_to :employee
  belongs_to :user
end
