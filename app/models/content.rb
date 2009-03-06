class Content < ActiveRecord::Base
  include AASM

   validates_presence_of :name, :language_id

   belongs_to :language

   has_permalink :name
  
   aasm_column :state
   aasm_initial_state :draft

   aasm_event :activate do
     transitions :to => :active, :from => [:draft]
   end
   aasm_event :desactivate do
     transitions :to => :draft, :from => [:active]
   end

   def active?
     return self.state=="active"
   end
end
