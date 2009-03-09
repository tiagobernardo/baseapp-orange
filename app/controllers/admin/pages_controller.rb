class Admin::PagesController < ApplicationController
  require_role :admin
  layout 'admin'
  def index
    @pages = Page.roots

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(params[:page])
    #doesnt work on create, huh...
    #@page.move_to_child_of params[:page][:parent_id] if !params[:page][:parent_id].nil?

    respond_to do |format|
      if @page.save
        flash[:notice] = 'Página foi gravada com sucesso.'
        format.html { redirect_to(admin_page_url(@page)) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @page = Page.find(params[:id])
    @page.move_to_child_of params[:page][:parent_id] if !params[:page][:parent_id].blank?
    
    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = 'Página foi gravada com sucesso.'
        format.html { redirect_to(admin_page_url(@page)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(admin_pages_url) }
      format.xml  { head :ok }
    end
  end
end
