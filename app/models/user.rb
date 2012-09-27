class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :shops, through: :user_shops
  has_many :user_shops
  belongs_to :city
  
  attr_accessible :email, :password, :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def to_s
  	self.email	
  end

  def admin?
    self.admin == true
  end

  def seller?
    self.user_shops != []
  end

end
