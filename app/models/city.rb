class City < ActiveRecord::Base
	default_scope order('name')

  has_many :areas
	has_many :users

  def to_s
    name
  end
end
