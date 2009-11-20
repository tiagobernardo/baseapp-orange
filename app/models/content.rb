class Content < ActiveRecord::Base
  include CommonOrangesForModels
  
  validates_presence_of :name, :language
  translatable_columns :name, :body
end
