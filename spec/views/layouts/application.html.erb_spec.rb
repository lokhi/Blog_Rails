require 'spec_helper'
describe "layouts/application" do
  it "should display latest posts" do
   render
   view.should render_template(:partial => "_last_posts")
  end
  
  it "should display latest comments" do
   render
   view.should render_template(:partial => "_last_comments")
  end
  
  it "display the new session view" do
    render
    view.should render_template(:partial => "_new")
  end
  
end
