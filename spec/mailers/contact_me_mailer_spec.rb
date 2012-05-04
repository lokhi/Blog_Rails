require 'spec_helper'

describe ContactMeMailer do
  describe "contact" do
    before(:each) do
      @mail=ContactMeMailer.contact("toto","toto@toto.com","The content").deliver
    end
    
    it "should have perello.louis@gmail in to field" do
      @mail.to.should == ["testblograils@gmail.com"]
    end
    
    it "should have testblograils@gmail in to field" do
      @mail.from.should == ["testblograils@gmail.com"]
    end
    
    it " should have a subject" do
      @mail.subject.should =="contact from toto, toto@toto.com"
    end
    
    it "should have the content" do
      @mail.body.should =~ /The content/
    end
  end
end
