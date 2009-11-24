class Admin::PagesController < Admin::AdminController
   
  def new
    @page = Page.new(:state=>'active')
    new!
  end
    
  def order
    @page = Page.find(params[:id])
    @pages = @page.children
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

  def update
    update! do |format|
      if @page.errors.empty? # failure
        if (!params[:page][:parent_id].blank?) and (@page.parent_id!=params[:page][:parent_id].to_i)
          @page.move_to_child_of params[:page][:parent_id] 
        end
        format.html { redirect_to admin_pages_url  }
      end
    end
  end
  
  def create
    create! do |format|
      if @page.errors.empty? # failure
        if (!params[:page][:parent_id].blank?) and (@page.parent_id!=params[:page][:parent_id].to_i)
          @page.move_to_child_of params[:page][:parent_id] 
        end
        format.html { redirect_to admin_pages_url  }
      end
    end
  end
   
  protected 
    def collection
      @pages = Page.roots
    end 
end
