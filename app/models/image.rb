class Image < ActiveRecord::Base
  include AASM

   belongs_to :gallery
   validates_presence_of :name, :gallery

   has_attached_file :image, :styles => { :thumb=>"48x48#", :small=>["261x183#", :jpg], :big => ["482x342#", :jpg] }
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
