require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe News do
  before(:each) do
     @valid_attributes = { :name=>'a tagline', :body=>'this is a small content body', :language=>'pt' }
     @news = News.create(@valid_attributes)
   end

   it "should be valid with a full set of attributes" do
     @news.should be_valid
   end

   describe "in general " do     
     it { should validate_presence_of(:name) }
     it { should validate_presence_of(:language) }

     it "should not be valid without a name" do
       @news.name = nil
       @news.should_not be_valid
     end

     it "should not be valid without a language" do
       @news.language = nil
       @news.should_not be_valid
     end

     it 'should start in draft state' do
       @news.state.should=='draft'
     end

     it 'should have a valid permalink' do
       @news.permalink.should=="a-tagline"
     end
   end
end
