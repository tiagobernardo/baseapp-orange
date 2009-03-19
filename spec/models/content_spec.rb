require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Content do
  before(:each) do
    @valid_attributes = { :name=>'a tagline', :body=>'this is a small content body', :language=>'pt' }
    @content = Content.create(@valid_attributes)
  end

  it "should be valid with a full set of attributes" do
    @content.should be_valid
  end
  
  describe "in general " do    
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:language) }

    it 'should start in draft state' do
      @content.state.should=='draft'
    end
    
    it 'should have a valid permalink' do
      @content.permalink.should=="a-tagline"
    end
  end
end
