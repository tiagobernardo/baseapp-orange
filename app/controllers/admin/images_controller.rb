class Admin::ImagesController < ApplicationController
  require_role :admin
  layout 'admin'

  before_filter :load_gallery

  #DRY up the code by always loading workshop
  def load_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end


  def index
    @images = @gallery.images.paginate :all, :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @images }
    end
  end

  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @image }
    end
  end

  def new
    @image = Image.new
    @image.state ="active"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @image }
    end
  end

  def create
    @image = Image.new(params[:image])

    respond_to do |format|
      if @image.save
        flash[:notice] = 'A imagem foi criada com sucesso.'
        format.html {  redirect_to(admin_gallery_images_path(@gallery)) }
        format.xml  { render :xml => @image, :status => :created, :location => @image }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        flash[:notice] = 'A imagem foi gravada com sucesso.'
        format.html {  redirect_to(admin_gallery_images_path(@gallery)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to(admin_gallery_images_path(@gallery)) }
      format.xml  { head :ok }
    end
  end
end