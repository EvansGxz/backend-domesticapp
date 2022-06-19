class CreateCupons < ActiveRecord::Migration[7.0]
  def change
    create_table :cupons do |t|
      t.string :name
      t.integer :discount
      t.date :end_date

      t.timestamps
    end
  end
end
