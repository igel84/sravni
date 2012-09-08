#encoding: utf-8
class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create, :activate]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Вы успешно зарегистрировались на сайте"
    else
      render :new
    end
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'Активация прошла успешно')
    else
      not_authenticated
    end
  end
end
