require 'spec_helper'
describe "posts/show" do
  before(:each) do
    @p=stub_model(Post, :title => "title1",:body => "Content test")
    @p.stub(:getTag){"tag1,tag2"}
     assign(:post,@p)
  end
  it "should displays the post" do
    render
    rendered.should =~ /title1/
    rendered.should =~ /Content test/
    rendered.should =~ /tag1,tag2/
  end
  
  it "should comments" do
   render
   view.should render_template(:partial => "_listing_comment")
  end
  
  it "should the comment form" do
    render
    view.should render_template(:partial => "_form_comment")
  end
end
