class ServiceReportSerializer < ActiveModel::Serializer
  attributes :id, :body, :order_detail_id, :employee_id, :employee_name, :image_url

  def employee_name
    object.employee.full_name
  end

  has_one :order_detail

end
