class HomeController < ApplicationController
  skip_before_filter :require_login, :only => :wellcom

  def wellcom
  end

end
