class PromotionsController < ApplicationController
  before_filter :require_login

  def index
    @promotions = current_user.promotions
  end

  def create
    if params[:promotion][:id]
      @promotion = Promotion.find(params[:promotion][:id])
      @promotion.update_attributes(params[:promotion])
    else
      params[:promotion][:user_id] = current_user.id
      @promotion = Promotion.create(params[:promotion])
    end
  end

  def start
    @promotion = Promotion.find(params[:promotion_id])
  end

  def destroy
    @promotion = Promotion.find(params[:id])
    @promotion.destroy if @promotion.user == current_user
    redirect_to promotions_path
  end

end