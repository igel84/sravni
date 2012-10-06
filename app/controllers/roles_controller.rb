#encoding: utf-8
class RolesController < ApplicationController
  #skip_before_filter :require_login
  skip_before_filter :override_db

  before_filter :check_role

  def index
    @user = User.find(params[:user_id])
  end

  def create


    @user = User.find(params[:user_id])
    if params[:role][:shop_id] && !params[:role][:shop_id].blank?
      @user.add_role :shop, Shop.find(params[:role][:shop_id])
    elsif params[:role][:area_id] && !params[:role][:area_id].blank?
      @user.add_role :area, Area.find(params[:role][:area_id])
    elsif params[:role][:city_id] && !params[:role][:city_id].blank?
      @user.add_role :city, City.find(params[:role][:city_id])
    else
      @user.add_role :seller, Chain.find(params[:role][:chain_id])
    end
    flash[:info] = "Роль для пользователя " + @user.email + " успешно добавлена"
    redirect_to [@user, :roles]
  end

  def destroy
    @user = User.find(params[:user_id])
    Role.find(params[:id]).destroy
    flash[:info] = "Роль для пользователя " + @user.email + " успешно удалена"
    redirect_to [@user, :roles]
  end

  private
    def check_role
      flash[:info] = "Вы не обладаете достаточными правами для этих действий" if !current_user.admin?
      redirect_to edit_user_path(current_user) if !current_user.admin?
    end

end
