require 'spec_helper'
describe "posts/show" do
  before(:each) do
     assign(:post,stub_model(Post, :title => "title1",:body => "Content test"))
  end
  it "displays the post" do
    render
    rendered.should =~ /title1/
    rendered.should =~ /Content test/
  end
  
  it "displays comments" do
   render
   view.should render_template(:partial => "_listing_comment")

  end
  
  it "display the comment form" do
    render
    view.should render_template(:partial => "_form_comment")
  end
end
