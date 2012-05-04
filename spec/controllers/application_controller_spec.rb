require 'spec_helper'
describe ApplicationController do
 
  describe "current_user" do 
   before(:each) do
     session["current_user"]="toto"
    end
    it "should return the value of session['current_user']" do
      controller.current_user.should == "toto"
    end
  end
  
  
  describe "is_connected?" do
    context "the user is connected" do 
      before(:each) do
        session["current_user"]="toto"
      end
      it "should return true" do
        controller.is_connected?.should be_true
      end
    end
    
    context "the user is not connected" do 
      it "should return false" do
        controller.is_connected?.should be_false
      end
    end
  end
  
  
  describe "need_to_be_connected" do    
    context "the user is not connected" do
      before(:each) do
        session["current_user"]=nil
      end
      it "should redirect to new_session_path" do
        controller.should_receive(:redirect_to)
        controller.need_to_be_connected
      end
    end
    
    context "the user is connected" do
      before(:each) do
        session["current_user"]="toto"
      end
      it "should to nothing" do
        controller.need_to_be_connected
        response.status.should == 200
      end
    end
  end
end
