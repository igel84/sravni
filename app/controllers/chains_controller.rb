class ChainsController < ApplicationController
  skip_before_filter :require_login, :only => :wellcom

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
