class ServiceReportSerializer < ActiveModel::Serializer
  attributes :id, :body, :order_detail_id

  has_one :order_detail

end
