class CreateHabilityEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :hability_employees do |t|
      t.references :hability, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
