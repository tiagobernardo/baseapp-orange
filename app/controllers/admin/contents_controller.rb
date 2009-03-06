class Admin::ContentsController < ApplicationController
  require_role :admin
  layout 'admin'
  def index
    @contents = Content.paginate :all, :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contents }
    end
  end

  def show
    @content = Content.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @content }
    end
  end

  def new
    @content = Content.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @content }
    end
  end

  def edit
    @content = Content.find(params[:id])
  end

  def create
    @content = Content.new(params[:content])

    respond_to do |format|
      if @content.save
        flash[:notice] = 'Content was successfully created.'
        format.html { redirect_to(admin_content_url(@content)) }
        format.xml  { render :xml => @content, :status => :created, :location => @content }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @content = Content.find(params[:id])

    respond_to do |format|
      if @content.update_attributes(params[:content])
        flash[:notice] = 'Content was successfully updated.'
        format.html { redirect_to(admin_content_url(@content)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @content.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy

    respond_to do |format|
      format.html { redirect_to(admin_contents_url) }
      format.xml  { head :ok }
    end
  end
end
