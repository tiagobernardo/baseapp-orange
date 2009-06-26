class Admin::GalleriesController < ApplicationController

  require_role :admin
  layout 'admin'

  def index
    @galleries = Gallery.paginate :all, :page => params[:page], :order=>'created_at desc'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @galleries }
    end
  end

  def show
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gallery }
    end
  end

  def new
    @gallery = Gallery.new
    @gallery.language = "pt"
    @gallery.state ="active"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gallery }
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def create
    @gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save
        flash[:notice] = 'Gallery foi criado com sucesso.'
        format.html {  redirect_to(admin_galleries_url) }
        format.xml  { render :xml => @gallery, :status => :created, :location => @gallery }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        flash[:notice] = 'Gallery foi gravado com sucesso.'
        format.html {  redirect_to(admin_galleries_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to(admin_gallery_url) }
      format.xml  { head :ok }
    end
  end
end