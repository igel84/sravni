class City < ActiveRecord::Base
	has_many :areas

  def to_s
    name
  end
end
