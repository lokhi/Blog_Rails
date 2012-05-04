require 'spec_helper'

describe ContactController do
  describe "POST 'create'" do
    before(:each) do
      @p = {:contact => {:name =>"name",:mail=>"toto@mail.com",:ip=>"127.0.0.1",:content=>"The content"}}
      @mail=double("mail")
      ContactMeMailer.stub(:contact){@mail}
      @mail.stub(:deliver)
    end

    
    it "should use the methode contact of mailer Contact" do
      ::ContactMeMailer.should_receive(:contact)
      post 'create',@p
    end

    it "should put a flash msg" do
      post 'create',@p
      flash[:msg].should == "Thanks i will read it as soon as possible :)"
    end
    
    it "should redirect to the root" do
      post 'create',@p
      response.should redirect_to("/")
    end  
  end
end
