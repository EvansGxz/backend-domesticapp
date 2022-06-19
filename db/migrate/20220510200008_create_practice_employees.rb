class CreatePracticeEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :practice_employees do |t|
      t.references :practice, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
