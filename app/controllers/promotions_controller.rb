class PromotionsController < ApplicationController
  before_filter :require_login

  def create
    @promotion = Promotion.create(params[:promotion])
  end

  def start
    @promotion = Promotion.find(params[:promotion_id])
  end

end