class CreateCustomerNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_notifications do |t|
      t.string :name
      t.string :body
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
