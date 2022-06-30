class EmployeeCategorySerializer < ActiveModel::Serializer
  attributes :id, :full_name, :category_id, :category_name, :price_col_complete,
             :price_col_half, :price_spain, :employee_id

  def category_name
    object.category.category_name
  end

  def category_id
    object.category.id
  end

  def price_col_complete
    object.category.price_col_complete
  end

  def price_col_half
    object.category.price_col_half
  end

  def price_spain
    object.category.price_spain
  end

  def full_name
    object.employee.full_name
  end

  def employee_id
    object.employee.id
  end
end
