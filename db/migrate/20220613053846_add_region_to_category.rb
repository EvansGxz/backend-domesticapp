class AddRegionToCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :region, :string
  end
end
