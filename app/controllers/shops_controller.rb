class ShopsController < ApplicationController
  skip_before_filter :require_login, :only => :wellcom

  def index
    if params[:area_id]
      @area = Area.find(params[:area_id])
      #@shops = Shop.where(area_id: @area.id).order('created_at DESC')
      current_user.admin == true ? @shops = Shop.where(area_id: @area.id).order('created_at DESC') :  @shops = Shop.where(area_id: @area.id).where(chain_id: current_user.chain.id).order('created_at DESC')
    else
      @area = Area.first
    end
  end

  def create
    if params[:city_id] && params[:area_id] && params[:chain_id] && params[:shop][:adds] != ''
      @area = Area.find(params[:area_id]) if params[:area_id]
      @chain = Chain.find(params[:chain_id]) if params[:chain_id]
      @shop = Shop.create(params[:shop])
      #render 'cities/show'
    elsif params[:shop][:area_id] != '' && params[:shop][:adds] != ''
      @area = Area.find(params[:shop][:area_id])
      @chain = current_user.chain if current_user.seller?
      params[:shop][:chain_id] = @chain.id.to_s
      @shop = Shop.create(params[:shop])
      current_user.admin == true ? @shops = Shop.where(area_id: @area.id).order('created_at DESC') :  @shops = Shop.where(area_id: @area.id).where(chain_id: current_user.chain.id).order('created_at DESC')      
      render 'index'      
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
      #render 'cities/show'
    elsif params[:city_id] == nil && params[:area_id] && params[:chain_id] == nil && params[:id]
      @shop = Shop.find(params[:id])
      @shop.destroy
      @area = Area.find(params[:area_id])
      current_user.admin == true ? @shops = Shop.where(area_id: @area.id).order('created_at DESC') :  @shops = Shop.where(area_id: @area.id).where(chain_id: current_user.chain.id).order('created_at DESC')
      render 'index'  
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
