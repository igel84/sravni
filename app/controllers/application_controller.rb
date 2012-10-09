#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :override_db
  before_filter :check_city

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
  def not_authenticated
    redirect_to main_app.login_path, :alert => "First login to access this page."
  end

  def check_city
    @city = City.find(session['city']) if session['city']
  end

  private
  # Собственно сам метод переключения 
  def override_db
    @current_city = City.find_by_name(request.subdomain) 
    @current_city = City.find(params[:city_id]) if params[:city_id] #&& @current_city.nil?
    @products = Product.all
    @users = User.all
    @chains = Chain.all
    #not_found unless @current_city

    if @current_city
      ActiveRecord::Base.clear_cache!
      ActiveRecord::Base.establish_connection(
          adapter: 'sqlite3',
          database: "db/#{@current_city.name}.sqlite3",
          pool: 5,
          timeout: 5000
      )      
    elsif current_user
      #
    elsif request.subdomain == 'sravnim-ka'
      #
    else
      #redirect_to root_url
    end    
  end

end
