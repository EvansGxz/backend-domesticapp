class AddLadaToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :lada, :string
  end
end
