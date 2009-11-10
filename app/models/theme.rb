class Theme < ActiveRecord::Base
  validates_presence_of :name 
  has_permalink :name

end
