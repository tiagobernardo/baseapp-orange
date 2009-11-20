class Admin::NewsController < InheritedResources::Base
  layout 'admin'
  require_role :admin
  defaults :route_prefix=>'admin'
  
  def new
     @news = News.new(:state=>'active')
     new!
  end
   
  def create
    create!{ admin_news_url }
  end
   
  def update
    update!{ admin_news_url }
  end

  protected 
  
  protected 
    def collection
        @news ||= end_of_association_chain.paginate(:all, :page=>params[:page], :order=>sort_order('created_at'))
    end   
end
