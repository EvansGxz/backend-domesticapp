class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :address, :active, :start_date, :service_time, :discount, :workday,
             :supply_food, :finish_date, :hours

  has_one :category
  has_one :employee
  has_one :customer
end
