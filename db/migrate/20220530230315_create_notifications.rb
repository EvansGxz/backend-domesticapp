class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :name
      t.string :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
