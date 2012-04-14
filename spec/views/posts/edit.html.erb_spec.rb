require 'spec_helper'

describe "posts/edit" do
  before(:each) do
    @post = stub_model(Post,:title => "Post1", :body => "content test")
    assign(:post, @post)
  end
  it "renders edit post form" do
    render
    rendered.should have_selector("form[action='/posts/#{@post.id}']")
    rendered.should have_selector("input[name='post[title]']")
    rendered.should have_selector("textarea[name='post[body]']")
    rendered.should have_selector("input[type='submit']")
  end
end
