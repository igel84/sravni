class XmlFilesController < ApplicationController
  skip_before_filter :require_login, :only => :wellcom

  def create
    @xml_file = XmlFile.create(params[:xml_file])
  end

end