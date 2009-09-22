class Admin::<%=file_name.pluralize.capitalize%>Controller < ApplicationController
  inherit_resources
  layout 'admin'
  respond_to :html, :xml
  require_role :admin
  defaults :route_prefix=>'admin'

  def new
    @<%= file_name -%> = <%= file_name.capitalize -%>.new
    @<%= file_name -%>.language = "pt"
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
       @<%= file_name.pluralize -%> = <%= file_name.capitalize -%>.paginate :all, :page => params[:page], :order=>'created_at desc'
    end
end