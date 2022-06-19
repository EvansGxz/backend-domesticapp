class CreateCuponUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :cupon_users do |t|
      t.references :cupon, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
