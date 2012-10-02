class XmlFile < ActiveRecord::Base
  has_attached_file :attach
  belongs_to :shop
end
