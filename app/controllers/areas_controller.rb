class AreasController < ApplicationController
  skip_before_filter :require_login, :only => :wellcom

  def show
    if params[:id] 
      @area = Area.find(params[:id]) || Area.first
      render 'cities/show'
    else
      redirect_to cities_path(@city.id)
    end
  end

end