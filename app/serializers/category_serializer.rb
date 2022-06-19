class CategorySerializer < ActiveModel::Serializer
  attributes :id, :body, :category_name, :price_col_complete, :price_col_half, :price_spain, :image_url, :region, :sector

  def sector
    object.sector.name
  end
end
