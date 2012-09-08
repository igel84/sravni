class HomeController < ApplicationController
  before_filter :require_login#, :only => :wellcom

  def wellcom
  end

end
