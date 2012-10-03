class Product < ActiveRecord::Base
	#has_and_belongs_to_many :shops

  has_many :shops, through: :shop_products
  has_many :shop_products
end
