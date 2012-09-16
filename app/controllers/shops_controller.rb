class ShopsController < ApplicationController
  skip_before_filter :require_login, :only => :wellcom

  def create
    if params[:city_id] && params[:area_id] && params[:chain_id]
      @area = Area.find(params[:area_id]) if params[:area_id]
      @chain = Chain.find(params[:chain_id]) if params[:chain_id]
      Shop.create(params[:shop])
      render 'cities/show'
    else
      redirect_to cities_path(@city.id)
    end
  end

  def update
    if params[:city_id] && params[:area_id] && params[:chain_id] && params[:id]
      @area = Area.find(params[:area_id]) if params[:area_id]
      @chain = Chain.find(params[:chain_id]) if params[:chain_id]
      @shop = Shop.find(params[:id])
      @shop.update_attributes(params[:shop])
      render 'cities/show'
    else
      redirect_to cities_path(@city.id)
    end
  end

  def destroy
    if params[:city_id] && params[:area_id] && params[:chain_id] && params[:id]
      @area = Area.find(params[:area_id]) if params[:area_id]
      @chain = Chain.find(params[:chain_id]) if params[:chain_id]
      @shop = Shop.find(params[:id])
      @shop.destroy
      render 'cities/show'
    else
      redirect_to cities_path(@city.id)
    end
  end

  def show
    if params[:id] 
      @area = Area.find(params[:area_id]) if params[:area_id]
      @chain = Chain.find(params[:id]) || Chain.first
      render 'cities/show'
    else
      redirect_to cities_path(@city.id)
    end
  end

end
