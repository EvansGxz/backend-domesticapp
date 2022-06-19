class AddBiografyToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :biografy, :text
  end
end
