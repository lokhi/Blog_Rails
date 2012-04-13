require 'spec_helper'

describe 'delete_post' do
  before(:each) do
    @post = Post.create(:title => "Post1", :body => "content test")
  end
    
  it "should print a link to show the post on the posts page" do
    visit posts_path
    page.should have_link('Delete' , :href => delete_post_path(@post.id))
  end
  
  it "should print the post" do
    visit posts_path
    click_link "Delete"
    current_path.should == posts_path
    page.should have_no_content(@post.title)
  end
end
