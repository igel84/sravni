class AddNameToShopProduct < ActiveRecord::Migration
  def change
    add_column :shop_products, :name, :string
  end
end
