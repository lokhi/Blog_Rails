require 'spec_helper'

describe "send-mail" do
  it "should have a contact form" do
    visit posts_path
    page.should have_selector('form[id="contact"]')
    page.should have_field('contact[name]')
    page.should have_field('contact[mail]')
    page.should have_field('contact[content]')
  end
  
 it "should fill the contact form" do
  visit posts_path
  fill_in('contact[name]', :with => 'name')
  fill_in('contact[mail]', :with => 'toto@toto.com')
  fill_in('contact[content]', :with => 'The content')
  click_button('Send')
  page.should have_content('Thanks i will read it as soon as possible :)')
 end
end
