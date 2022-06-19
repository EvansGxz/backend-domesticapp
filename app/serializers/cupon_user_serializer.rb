class CuponUserSerializer < ActiveModel::Serializer
  attributes :id, :cupon_id

  def cupon_id
    object.cupon.id
  end
  has_one :cupon
  has_one :customer
end
