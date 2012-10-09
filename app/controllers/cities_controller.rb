class CitiesController < ApplicationController
  skip_before_filter :override_db, :only => :index
  skip_before_filter :require_login, :only => :wellcom

  def show
    if @current_city && params[:area_id].nil? && params[:chain_id].nil? && params[:shop_id].nil?
      @city = @current_city
      session['city'] = @city.id
      @temp_shops = Shop.order('raiting').page params[:page]
    
    elsif @current_city && !params[:area_id].nil? && params[:chain_id].nil? && params[:shop_id].nil?
      @city = @current_city
      @area = Area.find(params[:area_id])
      session['city'] = @city.id      
      @temp_shops = Shop.where(area_id: @area.id).order('raiting').page params[:page]

    elsif @current_city && params[:area_id].nil? && !params[:chain_id].nil? && params[:shop_id].nil?
      @city = @current_city
      @chain = Chain.find(params[:chain_id])
      session['city'] = @city.id      
      @temp_shops = Shop.where(chain_id: @chain.id).order('raiting').page params[:page]

    elsif @current_city && !params[:area_id].nil? && !params[:chain_id].nil? && params[:shop_id].nil?
      @city = @current_city
      @area = Area.find(params[:area_id])
      @chain = Chain.find(params[:chain_id])
      session['city'] = @city.id      
      @temp_shops = Shop.where(chain_id: @chain.id, area_id: @area.id).order('raiting').page params[:page]

    elsif @current_city && params[:area_id].nil? && params[:chain_id].nil? && !params[:shop_id].nil?
      @city = @current_city
      @shop = Shop.find(params[:shop_id])
      session['city'] = @city.id      
      @temp_shops = Shop.where(id: @shop.id).order('raiting').page params[:page]
    end    
  end

end
