class Theme < ActiveRecord::Base
  validates_presence_of :name, :language
  has_permalink :name

end
