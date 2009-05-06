require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PagesController do

  #Delete this example and add some real ones
  it "should use PagesController" do
    controller.should be_an_instance_of(PagesController)
  end
  it 'should show all pages succesfully' do
      get :index
      response.should be_success
      
      #flash[:notice].should     be_nil
      #flash[:error ].should_not be_nil
   end
   
  it 'should show a page succesfully' do
    
    get :show, :permalink =>'test'
    page = mock_model(Page)
    Page.should_receive(:find).with("test").and_return(page)
    response.should be_success
  end
     
end
