class CreateServiceReports < ActiveRecord::Migration[7.0]
  def change
    create_table :service_reports do |t|
      t.string :body
      t.references :order_detail, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
