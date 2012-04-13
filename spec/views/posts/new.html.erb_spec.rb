require 'spec_helper'

describe "posts/new.html.erb" do
  it "renders new post form" do
    render
    rendered.should have_selector("form[action='/posts']")
    rendered.should have_selector("input[name='post[title]']")
    rendered.should have_selector("textarea[name='post[body]']")
    rendered.should have_selector("input[type='submit']")
  end
end
