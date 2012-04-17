require 'spec_helper'

describe "/comments/_form_comment" do
  before(:each) do
    @p = stub_model(Post, :title => "title1",:body => "Content test")
    @c = @p.comments.create({:name => "louis",:content => "my comment"})
    assign(:post,@p)
  end
  it "should renders list of comments" do
    render :partial => "comments/listing_comment"
    rendered.should =~ /louis/
    rendered.should =~ /my comment/
  end
  
 it "should renders the link to delete a comment" do
  render :partial => "comments/listing_comment"
  rendered.should have_link('Delete', :href => delete_comment_path(@p.id,@c.id))
 end
end
