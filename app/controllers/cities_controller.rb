class CitiesController < ApplicationController
  skip_before_filter :require_login, :only => :wellcom

  def show
    if params[:id] && params[:area_id].nil? && params[:chain_id].nil?
      @city = City.find(params[:id]) || City.first
      session['city'] = @city.id   

      @temp_shops = []

      1.upto(5) do
        shops = nil
        count = 0
        while (shops == nil || shops == []) && count < 100000
          shops = Shop.all(:joins => { :area => :city }, :conditions => { :cities => { :id => @city.id }, :chain_id => rand(Chain.count) }, limit: 1, order: `rand()` ) # .select("sh.chain_id").where("ci.id = ?", @city.id).joins("as sh inner join cities as ci on sh.area_id = ci.area_id")
          count+=1
          shops = nil if @temp_shops.include?(shops)
        end
        @temp_shops = @temp_shops | shops
      end
      
      @temp_shops.uniq!

      count = @temp_shops.count

      @temp_shops += Shop.all(:joins => { :area => :city }, :conditions => { :cities => { :id => @city.id } }, limit: (5 - count), order: `rand()` ) if count < 5
      @temp_shops.shuffle
      
      #@temp_shops = @temp_shops.where(chain_id: 2)
      @shops = nil

      #@city.areas.each do |area|
      #  @temp_shops << area.shops
      #end

      #count = @temp_shops.size
      #@temp_shops.slice!(5..count-1).shuffle if count > 0

      #1.upto(7) do |i|
      #  @shops << @temp_shops[i] if @temp_shops != []
      #end

      #@shops = nil if @shops == []
    
    elsif params[:id] && params[:area_id] && params[:chain_id].nil?
      @area = Area.find(params[:area_id]) || Area.first
      @city = City.find(params[:id]) || City.first

      session['city'] = @city.id   

      @temp_shops = []

      1.upto(5) do
        shops = nil
        count = 0
        while (shops == nil || shops == []) && count < 100000
          shops = Shop.all(:conditions => { :area_id => @area.id, :chain_id => rand(Chain.count) }, limit: 1, order: `rand()` ) # .select("sh.chain_id").where("ci.id = ?", @city.id).joins("as sh inner join cities as ci on sh.area_id = ci.area_id")
          count+=1
          shops = nil if @temp_shops.include?(shops)
        end
        @temp_shops = @temp_shops | shops
      end
      
      @temp_shops.uniq!

      count = @temp_shops.count

      @temp_shops += Shop.all(:conditions => { :area_id => @area.id }, limit: (5 - count), order: `rand()` ) if count < 5
      @temp_shops.shuffle
    
    elsif params[:id] && params[:chain_id] && params[:area_id].nil?
      @city = City.find(params[:id]) || City.first
      @chain = Chain.find(params[:chain_id]) || Chain.first

      session['city'] = @city.id   

      @temp_shops = []

      1.upto(5) do
        shops = nil
        count = 0
        while (shops == nil || shops == []) && count < 100000
          shops = Shop.all(:joins => { :area => :city }, :conditions => { :cities => { :id => @city.id }, :chain_id => @chain.id }, limit: 1, order: `rand()` ) # .select("sh.chain_id").where("ci.id = ?", @city.id).joins("as sh inner join cities as ci on sh.area_id = ci.area_id")
          count+=1
          shops = nil if @temp_shops.include?(shops)
        end
        @temp_shops = @temp_shops | shops
      end
      
      @temp_shops.uniq!

      count = @temp_shops.count

      @temp_shops += Shop.all(:joins => { :area => :city }, :conditions => { :cities => { :id => @city.id }, :chain_id => @chain.id }, limit: (5 - count), order: `rand()` ) if count < 5
      @temp_shops.shuffle
    
    elsif params[:id] && params[:area_id] && params[:chain_id]
      @area = Area.find(params[:area_id]) || Area.first
      @city = City.find(params[:id]) || City.first
      @chain = Chain.find(params[:chain_id]) || Chain.first

      session['city'] = @city.id   

      @temp_shops = []

      1.upto(5) do
        shops = nil
        count = 0
        while (shops == nil || shops == []) && count < 100000
          shops = Shop.all(:conditions => { :area_id => @area.id, :chain_id => @chain.id }, limit: 1, order: `rand()` ) # .select("sh.chain_id").where("ci.id = ?", @city.id).joins("as sh inner join cities as ci on sh.area_id = ci.area_id")
          count+=1
          shops = nil if @temp_shops.include?(shops)
        end
        @temp_shops = @temp_shops | shops
      end
      
      @temp_shops.uniq!

      count = @temp_shops.count

      @temp_shops += Shop.all(:conditions => { :area_id => @area.id, :chain_id => @chain.id }, limit: (5 - count), order: `rand()` ) if count < 5
      @temp_shops.shuffle    
    else
      render 'city'
    end
  end

end
