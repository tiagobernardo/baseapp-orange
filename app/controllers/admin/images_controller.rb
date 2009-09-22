class Admin::ImagesController < InheritedResources::Base
 
 belongs_to :gallery
    before_filter :load_gallery
  # 
  #  #DRY up the code by always loading workshop
     def load_gallery
       @gallery = Gallery.find(params[:gallery_id])
     end

  layout 'admin'
  respond_to :html, :xml
  require_role :admin
  defaults :route_prefix=>'admin'
  
  def new
     @image = Image.new
     @image.state ="active"
     new!
  end
  
  def create
    create!{ admin_gallery_images_path(@gallery) }
  end
   
  def update
    update!{ admin_gallery_images_path(@gallery) }
  end

  protected 
    def collection
       @images = @gallery.images.paginate :all, :page => params[:page]
    end
   
end