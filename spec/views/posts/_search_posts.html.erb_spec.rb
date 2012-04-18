require 'spec_helper'

describe "/posts/_last_posts" do
  it "should renders title of the five lastes post" do
    render :partial => "posts/search_posts"
    rendered.should =~ /Search/
  end
end
