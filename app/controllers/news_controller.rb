class NewsController < ApplicationController

  def index
    @news = News.paginate(:all,  :conditions=>{:state=>"active", :language=>params[:locale]},:page=>params[:page], :order=>"created_at desc")
  end
  
  def show
    @news = News.find(:first, :conditions=>{:state=>"active", :permalink=>params[:permalink]})
  end
end
