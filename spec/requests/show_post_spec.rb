require 'spec_helper'

describe 'show_post' do
  before(:each) do
    @post = Post.create(:title => "Post1", :body => "content test")
  end
    
  it "should print a link to show the post on the posts page" do
    visit posts_path
    page.should have_link('Show' , :href => show_post_path(@post.id))
  end
  
  it "should print the post" do
    visit posts_path
    click_link "Show"
    current_path.should == show_post_path(@post)
    page.should have_content(@post.title)
    page.should have_content(@post.body) 
  end
end
