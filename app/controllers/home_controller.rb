class HomeController < ApplicationController
  skip_before_filter :require_login, :only => :wellcom

  def wellcom
    if params[:city] 
      @city = City.find(params[:city]) || City.first
      session['city'] = @city.id
      render 'cities/show'
    elsif session['city']
      @city = City.find(session['city'])
      render 'cities/show'
    else
      render 'city'
    end
  end

end
