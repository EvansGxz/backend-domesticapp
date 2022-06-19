class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :employee_category_id, :category_id, :category_name, :employee_id

  def full_name
    object.employee_category.employee.full_name
  end

  def employee_id
    object.employee_category.employee.id
  end

  def employee_category_id
    object.employee_category.id
  end

  def category_id
    object.employee_category.category.id
  end

  def category_name
    object.employee_category.category.category_name
  end
end
