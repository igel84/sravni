class PricesController < ApplicationController
  skip_before_filter :require_login, :only => :index
  skip_before_filter :override_db, :only => :index

  def index
    if params[:ids]
      @prices = ''
      Product.all.each do |product|  
        @prices += '<tr><td>' + product.name + '</td>'
        params[:ids].each do |key, val|
          @prices += '<td>' + ShopProduct.where(shop_id: key, product_id: product.id).first.try(:price).to_s + '</td>' unless key.nil?
        end
        @prices += '</tr>'          
      end
    end
    #render 'index'
  end

  def create
    @price_list = []
    params[:price].each do |key, val|
      price = Price.new        
      key.each do |key, val|
        price.product_id = val if key == 'product_id'
        price.name = val if key == 'name'
        price.value = val.gsub(',','.') if key == 'value'        
      end
      @price_list << price
    end

    @shop = 0

    if params[:city_id]
      @current_city = City.find(params[:city_id])
      ActiveRecord::Base.clear_cache!
      ActiveRecord::Base.establish_connection(
          adapter: 'sqlite3',
          database: "db/#{@current_city.name}.sqlite3",
          pool: 5,
          timeout: 5000
      )
      # on SHOP
      if params[:shop_id] && !params[:shop_id].blank? && params[:type] == 'shop'
        @price_list.each do |price|
          sh_pr = ShopProduct.where(shop_id: params[:shop_id], product_id: price.product_id, name: price.name).first
          if sh_pr
            sh_pr.destroy if price.value == '-'
            if price.value != '-'
              sh_pr.price = price.value
              sh_pr.save 
            end 
          else
            ShopProduct.create(shop_id: params[:shop_id], product_id: price.product_id, name: price.name, price: price.value)
          end
        end
      # on AREA
      elsif params[:area_id] && !params[:area_id].blank? && params[:type] == 'area'
        shop = 'dsf'
      # on CITY
      else  params[:city_id] && !params[:city_id].blank? && params[:type] == 'city'
        shop = 'dsf'
      end 
      @shop += Shop.all.count
    
    #on CHAIN
    elsif params[:chain_id] && !params[:chain_id].blank? && params[:type] == 'chain'
      City.all.each do |city|
        next unless city.id == 1 || city.id == 2
        ActiveRecord::Base.clear_cache!
        ActiveRecord::Base.establish_connection(
            adapter: 'sqlite3',
            database: "db/#{city.name}.sqlite3",
            pool: 5,
            timeout: 5000
        ) 
        @shop += Shop.all.count
        #@shop = 10
      end
    end

    render js: "$('.close-btn').click();alert('#{@shop}');"
  end

end