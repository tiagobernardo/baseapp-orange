 
 
module CommonOrangesForModels
  def self.included(base)
       base.class_eval {
         # Named scopes
          include AASM
         has_permalink :name 
         aasm_column :state 
         aasm_state :active
         aasm_state :draft
         aasm_initial_state :active

         #scopes
         named_scope :recent, lambda { |limit| {  :order =>'created_at desc', :limit=> limit}}
         named_scope :active, :conditions => { :state=>'active'}
         named_scope :by_permalink, proc { |permalink| { :conditions => {  :permalink => permalink } } }
         
         named_scope :newest, :order => "created_at DESC"
         named_scope :freshest, :order => "updated_at DESC"
         named_scope :limit, lambda { |limit| {:limit => limit} }
     }
  end
   
 

  def active?
    return self.state=="active"
  end

end
