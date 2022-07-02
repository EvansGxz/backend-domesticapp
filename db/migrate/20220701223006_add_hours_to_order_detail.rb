class AddHoursToOrderDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :hours, :string
  end
end
