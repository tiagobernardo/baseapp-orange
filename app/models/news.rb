class News < ActiveRecord::Base
  include AASM

   validates_presence_of :name, :language

   has_permalink :name 
   aasm_column :state
   aasm_initial_state :draft

   aasm_event :activate do
     transitions :to => :active, :from => [:draft]
   end
   aasm_event :deactivate do
     transitions :to => :draft, :from => [:active]
   end
   named_scope :recent, lambda { |locale| {:conditions => ["state = 'active' and language =?",locale], :order => 'created_at desc', :limit=>3}}

   def active?
     return self.state=="active"
   end
end
