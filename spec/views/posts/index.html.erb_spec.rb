require 'spec_helper'
describe "posts/index" do
  before(:each) do
  
    post= WillPaginate::Collection.create(1,3,4) do |page|
      page.replace([
           stub_model(Post, :title => "sujet 1",:body => "content1"),
           stub_model(Post, :title => "sujet 2",:body => "content2"),
           stub_model(Post, :title => "sujet 3",:body => "content3"),
           stub_model(Post, :title => "sujet 4",:body => "content4")
          ])
      end
    assign(:posts,post )
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
  
  it "should display the pagination link" do
    render
    rendered.should =~ /pagination/
  end
end
