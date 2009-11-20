class Page < ActiveRecord::Base
  include CommonOrangesForModels
  validates_presence_of :name
  belongs_to :theme
  
  translatable_columns :name, :body
  acts_as_nested_set
 
  named_scope :main_menu_parent, :conditions => ["state='active' and permalink=?", "home"]
  named_scope :footer_parent, :conditions => ["state='active' and permalink = ? ", "footer"]
  
  #for menu, return controller url associated with the theme
  def url
    return self.theme.controller unless self.theme.nil?
  end
  
  # example for erasing cache on hard drive
  # after_create :delete_cache 
  # after_save  :delete_cache 
  # after_destroy  :delete_cache 
  # protected
  # def delete_cache
  #   cache_dir = ActionController::Base.cache_store
  #   if cache_dir.cache_path == RAILS_ROOT+"/public/frags"
  #     FileUtils.rm_r(Dir.glob(cache_dir.cache_path+"/views/tabs*")) rescue Errno::ENOENT
  #     FileUtils.rm_r(Dir.glob(cache_dir.cache_path+"/views/footer*")) rescue Errno::ENOENT
  #   end
  # end
end
