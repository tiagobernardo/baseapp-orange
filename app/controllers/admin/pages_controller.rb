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
  
  def language
     @pages = Page.find(:all, :conditions=>{:language=>params[:language]})
  end
  
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end
  def order
    @page = Page.find(params[:id])
    @pages = @page.children

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  def sort
     page = Page.find(params[:rowid])
     prev_id = params[:previd]
     next_id = params[:nextid]

     if prev_id != ""
       page.move_to_right_of(prev_id)
     else
       page.move_to_left_of(next_id)
     end
     render :text => "ok"
   end
  
  def new
    @page = Page.new
    @page.language = "pt"
    @page.state ="active"
    
    
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
 
        if (!params[:page][:parent_id].blank?) and (@page.parent_id!=params[:page][:parent_id].to_i)
          @page.move_to_child_of params[:page][:parent_id] 
        end
          
        flash[:notice] = 'Página foi gravada com sucesso.'
        format.html { redirect_to(admin_pages_url) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @page = Page.find(params[:id])
    if (!params[:page][:parent_id].blank?) and (@page.parent_id!=params[:page][:parent_id].to_i)
      @page.move_to_child_of params[:page][:parent_id] 
    end
      
    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = 'Página foi gravada com sucesso.'
        format.html { redirect_to(admin_pages_url) }
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
