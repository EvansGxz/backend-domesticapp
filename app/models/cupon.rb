class Cupon < ApplicationRecord
  has_one :cupon_user, dependent: :destroy
end
