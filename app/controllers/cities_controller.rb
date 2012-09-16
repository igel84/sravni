class CitiesController < ApplicationController
  skip_before_filter :require_login, :only => :wellcom

  def show
    if params[:id] 
      @city = City.find(params[:id]) || City.first
      session['city'] = @city.id      
    else
      render 'city'
    end
  end

end
