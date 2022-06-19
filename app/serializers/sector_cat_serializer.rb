class SectorCatSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :category, :service, :price, :region

  def image_url
    object.category.image_url
  end

  def region
    object.category.region
  end

  def category
    object.sector.name
  end

  def service
    object.category.category_name
  end

  def price
    object.category.price
  end
end
