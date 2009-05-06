require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::PagesController do

  #Delete this example and add some real ones
  it "should use Admin::PagesController" do
    controller.should be_an_instance_of(Admin::PagesController)
  end
 
  it "should redirect a non-logged-in user" do
    get :index
    response.should be_redirect
  end
  
  it "should redirect a non-admin user" do
    login_as :aaron
    get :index
    response.should be_redirect
  end
  
 
  
  # it 'activates user' do
  #    User.authenticate('aaron', 'monkey').should be_nil
  #    get :activate, :activation_code => users(:aaron).activation_code
  #    response.should redirect_to('/login')
  #    flash[:notice].should_not be_nil
  #    flash[:error ].should     be_nil
  #    User.authenticate('aaron', 'monkey').should == users(:aaron)
  # end
  # 
  # it 'does not activate user without key' do
  #    get :activate
  #    flash[:notice].should     be_nil
  #    flash[:error ].should_not be_nil
  # end
   
end
