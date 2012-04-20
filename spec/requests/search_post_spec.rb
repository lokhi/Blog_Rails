require 'spec_helper'

describe "search_post" do
    before(:each) do
      Post.create(:title => "title1", :body => "body") 
      Post.create(:title => "title2", :body => "hello world") 
      Post.create(:title => "title3", :body => "body") 
      Post.create(:title => "title4", :body => "body") 
      Post.create(:title => "title5", :body => "body") 
      Post.create(:title => "title6", :body => "body") 
      Post.create(:title => "title7", :body => "body") 
    end
    it "should print the form to search posts" do
      visit posts_path
      page.should have_selector('form')
    end
    
    it "should search posts and print them" do
      visit posts_path
      fill_in('search', :with => 'hello')
      click_button('Search')
      page.should have_content('title2')
      page.should_not have_content('title1')
    end
end
