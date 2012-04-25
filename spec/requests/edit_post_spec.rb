require 'spec_helper'

describe 'edit_post' do
  before(:each) do
    @post = Post.create(:title => "Post1", :body => "content test")
    Capybara.current_session.driver.browser.current_session.instance_variable_get(:@rack_mock_session).cookie_jar[:stub_session]="toto"
  end
    
  it "should print a link to edit the post on the posts page" do
    visit posts_path
    page.should have_link('Edit' , :href => edit_post_path(@post))
  end
  it "should print the form to update a new post" do
    visit edit_post_path(@post)
    page.should have_content('Edit the post')
    page.should have_selector('form')
  end
    
  it "should fill the form and views the new title in the posts page" do
    visit edit_post_path(@post)
    fill_in('post[title]', :with => 'New title')
    fill_in('post[body]', :with => 'content test ok')
    click_button('Update')
    current_path.should == posts_path
    page.should have_content('New title')
  end
end
