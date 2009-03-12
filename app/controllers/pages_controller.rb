class PagesController < ApplicationController

  def show
     
    @page = Page.find(:first, :conditions=>{:state=>"active", :permalink=>params[:permalink]})
  end
  
end
