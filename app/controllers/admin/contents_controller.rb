class Admin::ContentsController < Admin::AdminController
    
  def new
    @content = Content.new
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
       @contents ||= end_of_association_chain.paginate(:all, :page => params[:page], :order=>sort_order('created_at'))
    end
end