require 'spec_helper'

describe "/comments/_form_comment" do
  before(:each) do
    @p=stub_model(Post, :title => "title1",:body => "Content test")
    assign(:post,@p)
  end
  it "renders new comment form" do
    render :partial => "comments/form_comment"
    rendered.should have_selector("form[action='/posts/#{@p.id}/comments']")
    rendered.should have_selector("input[name='comment[name]']")
    rendered.should have_selector("textarea[name='comment[content]']")
    rendered.should have_selector("input[type='submit']")
  end
end
