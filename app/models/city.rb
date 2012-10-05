class City < ActiveRecord::Base
  establish_connection "production"

  default_scope order('alias')

  has_many :areas
	has_many :users

  def to_s
    name
  end
end
