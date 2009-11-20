class News < ActiveRecord::Base
  include CommonOrangesForModels

  validates_presence_of :name, :lead, :body
  translatable_columns :name, :lead, :body
  
  named_scope :recent, lambda { |locale| {:conditions => ["state = 'active' and language =?",locale], :order => 'created_at desc', :limit=>3}}
  
 
end
