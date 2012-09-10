class CreateUserShops < ActiveRecord::Migration
  def change
    create_table :user_shops do |t|
      t.integer :user_id
      t.integer :shop_id
      t.string :post

      t.timestamps
    end
  end
end
