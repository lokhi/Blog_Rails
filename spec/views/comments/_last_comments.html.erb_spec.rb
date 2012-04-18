require 'spec_helper'

describe "/comments/_last_comments" do
  before(:each) do
    @p = Post.create(:title => "title1")
    @p.comments.create(:name => "name1" , :content => "comment1")
    @p.comments.create(:name => "name2" , :content => "comment2")
    @p.comments.create(:name => "name3" , :content => "comment3")
    @p.comments.create(:name => "name4" , :content => "comment4")
    @p.comments.create(:name => "name5" , :content => "comment5")
    @p.comments.create(:name => "name6" , :content => "comment6")
  end
  it "should renders title of the five lastes post" do
    render :partial => "comments/last_comments"
    rendered.should =~ /comment6/
    rendered.should_not =~ /comment1/
  end
  
  it "should renders link with anchor" do
    render :partial => "comments/last_comments"
    rendered.should have_link('comment5...', :href => show_post_path(@p.id)+'#comment_5')
  end
end
