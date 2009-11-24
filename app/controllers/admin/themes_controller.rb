class Admin::ThemesController < Admin::AdminController
    
  def new
    @theme = Theme.new
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
       @themes ||= end_of_association_chain.paginate(:all, :page => params[:page], :order=>sort_order('created_at'))
    end
end