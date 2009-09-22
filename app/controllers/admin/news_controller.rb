class Admin::NewsController < InheritedResources::Base
 

  layout 'admin'
  respond_to :html, :xml
  require_role :admin
  defaults :route_prefix=>'admin'
  
  def new
     @news = News.new
     @news.language = "pt"
     @news.state ="active"
     new!
  end
   
  def create
    create!{ admin_news_url }
  end
   
  def update
    update!{ admin_news_url }
  end

  protected 
    def collection
      @news =  News.paginate :all, :page => params[:page]
    end
   
end
