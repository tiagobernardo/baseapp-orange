class PagesController < ApplicationController
 
  def show
    @page = Page.active.by_permalink(params[:permalink]).first
    set_tags
  end

  protected
    def set_tags
      @page_title = @page.name_pt
      #set desc & keywords if you like
      #@page_description = "page description"
      #@page_keywords = "page keywords"
    end
end
