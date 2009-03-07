class Admin::DashboardController < ApplicationController
  require_role :admin
  layout 'admin'
  
  def index
    @news = News.find :all, :order=>"created_at desc", :limit=>3
    @users = User.find :all, :order=>"created_at desc", :limit=>5
  end
end
