require 'spec_helper'

describe "add_comment" do
  before(:each) do
     @post = Post.create(:title => "Post1", :body => "content test")
  end
  describe "GET /post/:id" do    
    it "should display the form to add a comment" do
      visit show_post_path(@post)
      page.should have_content('Add your comment')
      page.should have_selector('form')
      page.should have_field('comment[name]')
      page.should have_field('comment[content]')
    end
    
    it "should create the post and print the posts" do
      visit new_post_path(@post)
      fill_in('comment[name]', :with => 'louis')
      fill_in('comment[body]', :with => 'my comment')
      click_button('Add the comment')
      current_path.should == show_post_path(@post.id)
      page.should have_content('louis')
    end
  end
end
