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
  
  it "should display the  session view" do
    render
    view.should render_template(:partial => "_session")
  end
  
  it "should display the contact form" do
    render
    view.should render_template(:partial => "_contact")
  end
end
