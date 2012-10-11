class Promotion < ActiveRecord::Base
  establish_connection "production"

  before_create :init_key

  validates_attachment_presence :banner  
  validates_attachment_size :banner, :less_than => 1.megabytes  
  validates_attachment_content_type :banner, :content_type => ['image/jpeg', 'image/png']  

  has_attached_file :banner, :styles => { :thumb => ["130x130", :png] }, :whiny => false

  def init_key
    self.key = "#{(0...10).map{ ('0'..'1000').to_a[rand(26)] }.join}"
  end

end
