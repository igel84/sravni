class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_city
  
  def not_authenticated
    redirect_to main_app.login_path, :alert => "First login to access this page."
  end

  def check_city
    @city = City.find(session['city']) if session['city']
  end
  
end
