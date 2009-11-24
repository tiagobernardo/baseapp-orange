class NewsController < ApplicationController

  def index
    @news = News.active.paginate(:all,:page=>params[:page])
  end
  
  def show
    @news = News.active.by_permalink(params[:permalink]).first
  end
end
