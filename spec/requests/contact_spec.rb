require 'spec_helper'

describe "contact" do
  describe "Post /contact" do
    
    it "should print the contact from" do
      visit posts_path
      page.should have_content('Contact me')
      page.should have_selector('form[id="contact"]')
    end
    
    it "should send a mail and print a confirmation message" do
      visit posts_path
      fill_in('contact[name]', :with => 'toto')
      fill_in('contact[mail]', :with => 'toto@toto.com')
      fill_in('contact[content]', :with => 'Hello World')
      click_button('Send')
      current_path.should == "/"
      page.should have_content('Thanks i will read it as soon as possible :)')
      ActionMailer::Base.deliveries.empty?.should be_false
    end
  end
end
