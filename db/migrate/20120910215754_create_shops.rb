class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :chain_id
      
      t.integer :area_id
      t.string :adds
      t.string :phone

      t.timestamps
    end
  end
end
