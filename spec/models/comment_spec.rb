require 'spec_helper'

describe Comment do
  describe "validation" do
    it "should not be valid without any attribut" do
      subject.valid?.should == false
    end
    
    it "should not be valid without a name" do
      subject.name="toto"
      subject.valid?.should == false
    end
    
    it "should not be valid without a content" do
      subject.content="content"
      subject.valid?.should == false
    end
    
    it "should be valid with a name and a content" do
      subject.name="toto"
      subject.content="content"
      subject.valid?.should == true
    end
  end
end
