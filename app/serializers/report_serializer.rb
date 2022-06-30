class ReportSerializer < ActiveModel::Serializer
  attributes :id, :body, :employee_id, :customer_id, :employee_name, :customer_name, :image_url,
             :created_at

  def employee_name
    object.employee.full_name
  end

  def customer_name
    object.customer.full_name
  end
end
