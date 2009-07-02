class Gallery < ActiveRecord::Base
  include AASM

  has_many :images
  
  validates_presence_of :name, :language

  has_permalink :name 

  aasm_column :state

  aasm_initial_state :draft
  aasm_state :active
  aasm_state :draft

  aasm_event :activate do
    transitions :to => :active, :from => [:draft]
  end
  aasm_event :deactivate do
    transitions :to => :draft, :from => [:active]
  end
  
  named_scope :recent, lambda { |locale| { :conditions=>["state=? and language=?", 'active', locale], :order => 'created_at desc', :limit=>5}}


  def active?
    return self.state=="active"
  end
  
  def name_and_language
    return "#{name} - #{language}"
  end
end
