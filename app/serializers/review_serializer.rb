class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :photo, :employee_id, :body, :score

  def full_name
    object.customer.full_name
  end

  def employee_id
    object.employee.id
  end

  def photo
    object.customer.image_url
  end
end
