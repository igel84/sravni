class HomeController < ApplicationController
  skip_before_filter :require_login, :only => :wellcom

  def wellcom
    if params[:city] 
      @city = City.find(params[:city]) || City.first
      session['city'] = @city.id
    elsif session['city']
      @city = City.find(session['city'])
    else
      render 'city'
    end
  end

end
