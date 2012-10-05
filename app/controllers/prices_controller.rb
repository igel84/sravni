class PricesController < ApplicationController
  skip_before_filter :require_login, :only => :show

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

end