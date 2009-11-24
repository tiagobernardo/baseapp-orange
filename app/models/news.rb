class News < ActiveRecord::Base
  include CommonOrangesForModels

  validates_presence_of :name, :lead, :body
  translatable_columns :name, :lead, :body
  
  named_scope :recent, lambda { |limit| {:order => 'created_at desc', :limit=>limit}}
  
 
end
