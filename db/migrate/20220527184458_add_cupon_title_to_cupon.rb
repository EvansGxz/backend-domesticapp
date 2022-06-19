class AddCuponTitleToCupon < ActiveRecord::Migration[7.0]
  def change
    add_column :cupons, :cupon_title, :string
  end
end
