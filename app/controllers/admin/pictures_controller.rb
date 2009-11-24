class Admin::PicturesController <  Admin::AdminController
  
  def create
    create!{ admin_pictures_url }
  end
   
  def update
    update!{ admin_pictures_url }
  end

  protected 
    def collection
       @pictures ||= end_of_association_chain.paginate(:all, :page => params[:page], :order=>sort_order('created_at'))
    end
end