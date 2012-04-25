require 'spec_helper'

describe " destroy session" do
  describe "DELETE /session/delete" do
    before(:each) do
       Capybara.current_session.driver.browser.current_session.instance_variable_get(:@rack_mock_session).cookie_jar[:stub_session]="toto"
    end
    it "should print a link to delete the post on the posts page" do
      visit posts_path
      page.should have_link('Disconnect' , :href => delete_session_path) 
    end
    
    it "should destroy the session" do
      visit posts_path
      click_link "Disconnect"
      page.should_not have_content("toto")
    end
  end
end
