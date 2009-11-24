class Admin::DashboardController < Admin::AdminController
 
  def index
    @news   = News.find :all, :order=>"created_at desc", :limit=>3
    @users  = User.find :all, :order=>"created_at desc", :limit=>3
    @pages  = Page.find :all, :order=>'created_at desc', :limit=>3
  end
end
