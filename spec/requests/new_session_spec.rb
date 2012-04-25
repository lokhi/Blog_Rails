require 'spec_helper'
require 'capybara/mechanize'


describe " new session" ,:driver => :mechanize do
  before(:each) do
    Capybara.default_host = "http://lokhi-labs:3000"
  end
  describe "GET /session/new" do
    it "should have a link to log in" do
      visit posts_path
      page.should have_link('Login' , :href => new_session_path)
    end
    
    it "should redirect to the Sauth" do
      visit posts_path
      click_link('Login')
      page.should have_content('Authentification service')
      page.should have_selector('form')
    end
  end
  describe " GET /session" do
    it "should put the login of the user in session[current_user]" do
      visit posts_path
      click_link('Login')
      fill_in('user[login]', :with => 'toto')
      fill_in('user[password]', :with => 'test')
      click_button('Sign in')
      page.should have_content('toto')
    end 
  end
end
