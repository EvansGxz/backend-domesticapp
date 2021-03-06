class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.decimal :price_col_complete
      t.decimal :price_col_half
      t.decimal :price_spain
      t.references :sector, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
