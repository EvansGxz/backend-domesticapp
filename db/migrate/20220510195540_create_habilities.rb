class CreateHabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :habilities do |t|
      t.string :hability
      t.string :body
      t.integer :score

      t.timestamps
    end
  end
end
