class Admin::ContentsController < InheritedResources::Base
  layout 'admin'
  respond_to :html, :xml
  require_role :admin
  defaults :route_prefix=>'admin'
  
  def new
     @content = Content.new
     @content.language = "pt"
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
      @contents =  Content.paginate :all, :page => params[:page]
    end
end
