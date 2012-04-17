require 'spec_helper'

describe "/posts/_last_posts" do
  before(:each) do
    Post.create(:title => "title1")
    Post.create(:title => "title2")
    Post.create(:title => "title3")
    Post.create(:title => "title4")
    Post.create(:title => "title5")
    Post.create(:title => "title6")
  end
  it "should renders title of the five lastes post" do
    render :partial => "posts/last_posts"
    rendered.should =~ /title6/
    rendered.should_not =~ /title1/
  end
end
