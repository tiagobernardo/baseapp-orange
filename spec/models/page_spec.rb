require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Page do
  before(:each) do
    @valid_attributes = { :name=>'a tagline', :body=>'this is a small content body', :language=>'pt' }
    @page = Page.create(@valid_attributes)
  end

  it "should be valid with a full set of attributes" do
    @page.should be_valid
  end

  describe "in general " do      
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:language) }
  
    it "should not be valid without a name" do
      @page.name = nil
      @page.should_not be_valid
    end

    it "should not be valid without a language" do
      @page.language = nil
      @page.should_not be_valid
    end

    it 'should start in draft state' do
      @page.state.should=='draft'
    end
    
    it 'should have a valid permalink' do
      @page.permalink.should=="a-tagline"
    end
  end
end
