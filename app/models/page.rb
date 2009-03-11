class Page < ActiveRecord::Base
  include AASM

  validates_presence_of :name, :language
  
  has_permalink :name
  acts_as_nested_set
  aasm_column :state
  aasm_initial_state :draft
  
  aasm_event :activate do
    transitions :to => :active, :from => [:draft]
  end
  aasm_event :deactivate do
    transitions :to => :draft, :from => [:active]
  end
  
  def self.main_menu(locale="en")
    Page.roots.find(:all, :conditions=>{:state=>"active", :language=>locale})
  end
  
  def active?
    return self.state=="active"
  end
  
end
