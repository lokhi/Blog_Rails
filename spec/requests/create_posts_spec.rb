require 'spec_helper'

describe "CreatePosts" do
  before(:each) do
      Capybara.current_session.driver.browser.current_session.instance_variable_get(:@rack_mock_session).cookie_jar[:stub_session]="toto"
    end
  describe "GET /create_posts" do
    it "should have a link to create a post" do
      visit posts_path
      page.should have_link('New Post' , :href => new_post_path)
    end
    
    it "should print the form to create a new post" do
      visit posts_path
      click_link('New Post')
      page.should have_content('Create a new post')
      page.should have_selector('form')
    end
    
    it "should create the post and print the posts" do
      visit new_post_path
      fill_in('post[title]', :with => 'title1')
      fill_in('post[body]', :with => 'thecontent')
      fill_in('tags', :with => 'tag1,tag2,tag3')
      click_button('New Post')
      current_path.should == posts_path
      page.should have_content('title1')
    end
  end
end
