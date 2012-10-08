class Chain < ActiveRecord::Base
  establish_connection "production"
  resourcify
  
	has_many :shops

	has_attached_file :logo, :styles => { :thumb=> ["140x140", :jpg] }, :whiny => false

   def to_s
    name
  end
end
