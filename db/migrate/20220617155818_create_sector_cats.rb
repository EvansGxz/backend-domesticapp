class CreateSectorCats < ActiveRecord::Migration[7.0]
  def change
    create_table :sector_cats do |t|
      t.references :sector, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
