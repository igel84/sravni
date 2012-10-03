class Area < ActiveRecord::Base
	belongs_to :city
	has_many :shops

  def to_s
    name
  end
  def to_label
    name + ' ' + self.city.name
  end

  #def name
  #  return name # + ' - ' + self.city.name
  #end
end
