class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.string :address
      t.date :start_date
      t.date :finish_date
      t.string :service_time
      t.string :discount
      t.string :workday
      t.string :supply_food
      t.boolean :active, default: true
      t.references :category, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
