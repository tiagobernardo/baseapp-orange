class Admin::<%=file_name.pluralize.capitalize%>Controller < Admin::AdminController
    
  def new
    @<%= file_name -%> = <%= file_name.capitalize -%>.new
    new!
  end
  
  def create
    create!{ admin_<%= file_name.pluralize -%>_url }
  end
   
  def update
    update!{ admin_<%= file_name.pluralize -%>_url }
  end

  protected 
    def collection
       @<%= file_name.pluralize -%> ||= end_of_association_chain.paginate(:all, :page => params[:page], :order=>sort_order('created_at'))
    end
end