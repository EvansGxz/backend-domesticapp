class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :client_type
      t.date :birth_date
      t.string :region
      t.string :cod_refer
      t.references :user, null: false, foreign_key: true
      t.string :country
      t.string :document_type
      t.string :document_id
      t.boolean :new, :boolean, :active, default: true

      t.timestamps
    end
  end
end
