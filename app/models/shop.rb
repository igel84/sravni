class Shop < ActiveRecord::Base
	belongs_to :area
	belongs_to :chain

	#has_and_belongs_to_many :products
  has_many :products, through: :shop_products
  has_many :shop_products

	has_many :users, through: :user_shops
  has_many :user_shops

  has_many :xml_files

  def label
    name + ' ' + adds
  end

  def set_raiting
    @products = Product.all

    self.raiting = 0
    self.save

    count_prod = 0
    count_price = 0
    @products.each do |prod|
      sh_pr = ShopProduct.where(product_id: prod.id, shop_id: self.id).minimum('price')
      if sh_pr && sh_pr != 0
        count_prod += 1
        count_price += sh_pr
      end
    end

    if count_price != 0 && count_prod != 0 && count_prod == @products.count
      self.raiting = count_price.to_f / count_prod.to_f 
    else
      self.raiting = 1000
    end  
    self.save
  end

end
