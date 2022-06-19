class AddBodyToCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :body, :string
  end
end
