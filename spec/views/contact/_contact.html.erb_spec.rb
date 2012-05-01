require 'spec_helper'

describe "contact/_contact" do
  it "renders contact form" do
    render :partial => "contact/contact"
    rendered.should have_selector("form[action='/contact/create']")
    rendered.should have_selector("input[name='contact[name]']")
    rendered.should have_selector("input[name='contact[mail]']")
    rendered.should have_selector("textarea[name='contact[content]']")
    rendered.should have_selector("input[type='submit']")
  end
end
