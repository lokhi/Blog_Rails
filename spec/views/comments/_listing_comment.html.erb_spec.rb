require 'spec_helper'

describe "/comments/_form_comment" do
  before(:each) do
    session["current_user"] = "toto"
    @p = stub_model(Post, :title => "title1",:body => "Content test")
    @c = @p.comments.create({:name => "louis",:content => "my comment"})
    assign(:post,@p)
  end
  it "should renders list of comments" do
    render :partial => "comments/listing_comment"
    rendered.should =~ /louis/
    rendered.should =~ /my comment/
  end
 
 context "the user is connected " do
   it "should renders the link to delete a comment" do
    session["current_user"] = "toto"
    render :partial => "comments/listing_comment"
    rendered.should have_link('Delete', :href => delete_comment_path(@p.id,@c.id))
   end
 
 end
 
 context "the user is not connected " do
   it "should not renders the link to delete a comment" do
   session["current_user"] = nil
    render :partial => "comments/listing_comment"
    rendered.should_not have_link('Delete', :href => delete_comment_path(@p.id,@c.id))
   end
 
 end
 
 
 
 it "should renders the anchor to acces to the comment" do
   render :partial => "comments/listing_comment"
   rendered.should =~ /id="comment_1"/
 end
end
