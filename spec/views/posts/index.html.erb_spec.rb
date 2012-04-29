require 'spec_helper'
describe "posts/index" do
  before(:each) do
    assign(:posts, [
           stub_model(Post, :title => "sujet 1",:body => "content1"),
           stub_model(Post, :title => "sujet 2",:body => "content2")
          ])
  end
  it "displays all the posts" do
    render
    rendered.should =~ /sujet 1/
    rendered.should =~ /sujet 2/
  end
  
  it "should display the msg if flash msg not nill" do
    flash[:msg] = "Test success"
    render
    rendered.should =~ /Test success/
  end
end
