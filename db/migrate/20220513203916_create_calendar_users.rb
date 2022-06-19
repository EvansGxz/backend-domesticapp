class CreateCalendarUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :calendar_users do |t|
      t.string :name
      t.date :date
      t.string :time
      t.references :customer, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
