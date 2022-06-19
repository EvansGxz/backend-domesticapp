class CreateEmployeeCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
