class Gallery < ActiveRecord::Base
  include CommonOrangesForModels

  has_many :images
  validates_presence_of :name, :language
  translatable_columns :name, :body
end
