require 'spec_helper'

describe ContactController do
  describe "POST 'create'" do
    before(:each) do
      @p = {:contact => {:name =>"name",:mail=>"toto@mail.com",:ip=>"127.0.0.1",:content=>"The content"}}
    end

    
    it "should use the methode send of mailer Contact" do
      ContactMailer.should_receive(:contact).with(@p[:contact])
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
