class Chain < ActiveRecord::Base
	has_many :shops

	has_attached_file :logo, :styles => { :thumb=> ["140x140", :jpg] }, :whiny => false
end
