class Shop < ActiveRecord::Base
	belongs_to :area
	belongs_to :chain

	has_and_belongs_to_many :products

	has_many :users, through: :user_shops
  	has_many :user_shops

end
