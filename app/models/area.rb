class Area < ActiveRecord::Base
	belongs_to :city
	has_many :shops

  def to_s
    name
  end
end
