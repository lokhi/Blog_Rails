require 'spec_helper'

describe "/posts/_search_posts" do
  it "should renders the search form" do
    render :partial => "posts/search_posts"
    rendered.should =~ /Search/
  end
end
