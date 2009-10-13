class Admin::ThemesController < InheritedResources::Base

  layout 'admin'
  respond_to :html, :xml
  require_role :admin
  defaults :route_prefix=>'admin'
  
  def new
     @content = Content.new
     #@content.language = "pt"
     new!
  end
  
  def create
    create!{ admin_themes_url }
  end
   
  def update
    update!{ admin_themes_url }
  end

  protected 
    def collection
      @themes = Theme.paginate :all, :page => params[:page]
    end
end