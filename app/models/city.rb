class City < ActiveRecord::Base
	has_many :areas
	has_many :users

  def to_s
    name
  end
end
