require 'spec_helper'
describe "posts/show.html.erb" do
  it "displays the post" do
    assign(:post, stub_model(Post, :title => "title1",:body => "Content test"))
    render
    rendered.should =~ /title1/
    rendered.should =~ /Content test/
  end
end
