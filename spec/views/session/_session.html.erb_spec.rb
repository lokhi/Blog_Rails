require 'spec_helper'

describe "session/session" do
  context "user is not connected" do
    before(:each) do
    view.stub(:current_user)
  end
    it "should display the link to the Sauth" do
       render :partial => "session/session"
      rendered.should have_selector("a[href='/session/new?src=']")
    end
  end
  context "user is connected" do
    before(:each) do
      view.stub(:current_user){"toto"}
    end
    it "should display the name of the user" do
       render :partial => "session/session"
      rendered.should have_content("toto")
    end
    
    it "should display link to disconnect" do
       render :partial => "session/session"
      rendered.should have_selector("a[href='/session'][data-method='delete']")
    end
  end
end
