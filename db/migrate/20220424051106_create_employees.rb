class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :country
      t.date :birth_date
      t.string :region
      t.string :document_id
      t.string :document_type
      t.string :contact
      t.string :experience
      t.references :user, null: false, foreign_key: true
      t.boolean :new, :boolean, :active, default: true
      
      t.timestamps
    end
  end
end
