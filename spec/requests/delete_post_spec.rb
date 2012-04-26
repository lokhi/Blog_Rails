require 'spec_helper'

describe 'delete_post' do
  before(:each) do
    @post = Post.create(:title => "Post1", :body => "content test")
    Capybara.current_session.driver.browser.current_session.instance_variable_get(:@rack_mock_session).cookie_jar[:stub_session]="toto"
  end
    
  it "should print a link to delete the post on the posts page" do
    visit posts_path
    page.should have_link('Delete' , :href => delete_post_path(@post))
  end
  
  it "should not print the post" do
    visit posts_path
    click_link "Delete"
    current_path.should == posts_path
    page.should_not have_content(@post.title)
  end
end
