class Admin::<%=file_name.pluralize.capitalize%>Controller < ApplicationController

  require_role :admin
  layout 'admin'

  def index
    @<%= file_name.pluralize -%> = <%= file_name.capitalize -%>.paginate :all, :page => params[:page], :order=>'created_at desc'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @<%= file_name.pluralize -%> }
    end
  end

  def show
    @<%= file_name -%> = <%= file_name.capitalize -%>.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @<%= file_name -%> }
    end
  end

  def new
    @<%= file_name -%> = <%= file_name.capitalize -%>.new
    @<%= file_name -%>.language = "pt"
    @<%= file_name -%>.state ="active"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @<%= file_name -%> }
    end
  end

  def edit
    @<%= file_name -%> = <%= file_name.capitalize -%>.find(params[:id])
  end

  def create
    @<%= file_name -%> = <%= file_name.capitalize -%>.new(params[:<%= file_name -%>])

    respond_to do |format|
      if @<%= file_name -%>.save
        flash[:notice] = '<%= file_name.capitalize -%> foi criado com sucesso.'
        format.html {  redirect_to(admin_<%= file_name.pluralize -%>_url) }
        format.xml  { render :xml => @<%= file_name -%>, :status => :created, :location => @<%= file_name -%> }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @<%= file_name -%>.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @<%= file_name -%> = <%= file_name.capitalize -%>.find(params[:id])

    respond_to do |format|
      if @<%= file_name -%>.update_attributes(params[:<%= file_name -%>])
        flash[:notice] = '<%= file_name.capitalize -%> foi gravado com sucesso.'
        format.html {  redirect_to(admin_<%= file_name.pluralize -%>_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @<%= file_name -%>.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @<%= file_name -%> = <%= file_name.capitalize -%>.find(params[:id])
    @<%= file_name -%>.destroy

    respond_to do |format|
      format.html { redirect_to(admin_<%= file_name -%>_url) }
      format.xml  { head :ok }
    end
  end
end