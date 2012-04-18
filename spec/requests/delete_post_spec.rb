require 'spec_helper'

describe 'delete_post' do
  before(:each) do
    @post = Post.create(:title => "Post1", :body => "content test")
  end
    
  it "should print a link to delete the post on the posts page" do
    visit posts_path(@post)
    page.should have_link('Delete' , :href => delete_post_path(@post))
  end
  
  it "should not print the post" do
    visit posts_path(@post)
    click_link "Delete"
    current_path.should == posts_path
    page.should have_no_content(@post.title)
  end
end
