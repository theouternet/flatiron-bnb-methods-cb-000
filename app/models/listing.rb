class Listing < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :host, :class_name => "User"
  has_many :reservations
  has_many :reviews, :through => :reservations
  has_many :guests, :class_name => "User", :through => :reservations\
  
  
class Listing < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :host, :class_name => "User"
  has_many :reservations
  has_many :reviews, :through => :reservations
  has_many :guests, :class_name => "User", :through => :reservations\
  
  
  before_create :set_user_as_host
  before_destroy :set_user_as_not_host
  
  
def set_user_as_host 
  self.host.host = true
end 

def set_user_as_not_host
  self.host.host = false
end

end 