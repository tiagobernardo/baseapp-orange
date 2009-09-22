class Admin::GalleriesController < InheritedResources::Base
  layout 'admin'
  respond_to :html, :xml
  require_role :admin
  defaults :route_prefix=>'admin'
  
  def new
     @gallery = Gallery.new
     @gallery.language = "pt"
     @gallery.state ="active"
     new!
  end
  
  def create
    create!{ admin_contents_url }
  end
   
  def update
    update!{ admin_contents_url }
  end

  protected 
    def collection
      @galleries =  Gallery.paginate :all, :page => params[:page]
    end 
end