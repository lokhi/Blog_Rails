require 'spec_helper'
require 'capybara/mechanize'
Capybara.default_driver = :mechanize

describe " destroy session" do
  describe "DELETE /session/delete" do
    before(:each) do
      visit posts_path
      click_link('Login')
      fill_in('user[login]', :with => 'toto')
      fill_in('user[password]', :with => 'test')
      click_button('Sign in')
    end
    it "should print a link to delete the post on the posts page" do
      page.should have_link('Disconnect' , :href => delete_session_path)
    end
    
    it "should destroy the session" do
      click_link "Disconnect"
      page.should_not have_content("toto")
    end
  end
end
