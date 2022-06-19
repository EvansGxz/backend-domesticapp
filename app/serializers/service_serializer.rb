class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :service_name, :category_name, :category_id

  def category_name
    object.category.category_name
  end

  def category_id
    object.category.id
  end
end
