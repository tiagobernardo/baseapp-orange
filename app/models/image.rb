class Image < ActiveRecord::Base
  include CommonOrangesForModels

  belongs_to :gallery
  validates_presence_of :name, :gallery
  
  translatable_columns :name, :body
  has_attached_file :image, :styles => { :thumb=>["48x48#",:jpg] },
  :path=>":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension",
  :url=>"/system/:class/:attachment/:id/:style/:basename.:extension"
    
end
