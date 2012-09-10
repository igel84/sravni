class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def not_authenticated
    redirect_to main_app.login_path, :alert => "First login to access this page."
  end
  
end
