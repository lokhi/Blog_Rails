require 'spec_helper'

describe "search_post" do
    before(:each) do
      Post.create(:title => "title1", :body => "hello world") 
      Post.create(:title => "title2", :body => "body") 
    end
    it "should print the form to search posts" do
      visit posts_path
      page.should have_selector('form')
    end
    
    it "should search posts and print them" do
      visit posts_path
      fill_in('search', :with => 'hello')
      click_button('Search')
      page.should have_content('title1')
      page.should_not have_content('title2')
    end
end
