class Admin::AttachmentFilesController <  Admin::AdminController
  
  def create
    create!{ admin_attachment_files_url }
  end
   
  def update
    update!{ admin_attachment_files_url }
  end

  protected 
    def collection
       @attachment_files ||= end_of_association_chain.paginate(:all, :page => params[:page], :order=>sort_order('created_at'))
    end
end