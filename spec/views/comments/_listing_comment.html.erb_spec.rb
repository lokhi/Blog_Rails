require 'spec_helper'

describe "/comments/_form_comment" do
  before(:each) do
    @p=stub_model(Post, :title => "title1",:body => "Content test")
    @p.comments.create({:name => "louis",:content => "my comment"})
    assign(:post,@p)
  end
  it "renders list of comments" do
    render :partial => "comments/listing_comment"
    rendered.should =~ /louis/
    rendered.should =~ /my comment/
  end
end
