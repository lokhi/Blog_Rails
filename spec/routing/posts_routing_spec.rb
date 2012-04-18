require 'spec_helper'
describe PostsController do 
  it "routes to #index" do 
    get('/posts').should route_to("posts#index")
  end

  it "should provide the aliast post_path for /posts" do 
    posts_path.should == '/posts'
  end
  
  it "should route / to posts#index" do
    get('/').should route_to("posts#index")
  end
  
  it "routes to #new" do
    get('/posts/new').should route_to("posts#new")
  end
  
  it "should provide the alias new_post_path for /posts/new" do
    new_post_path.should == '/posts/new'
  end
  
  it "should routes to #create" do
    post('/posts').should route_to("posts#create")
  end
 
  it "should route to the edit form of a post" do
    { :get => "/posts/1/edit" }.should route_to(
      :controller => "posts",
      :action => "edit",
      :id => "1")
  end
  
  it "should routes to #update" do
    { :put => "/posts/1" }.should route_to(
      :controller => "posts",
      :action => "update",
      :id => "1")
  end
  
  it "should routes to #show" do
    { :get => "/posts/1" }.should route_to(
      :controller => "posts",
      :action => "show",
      :id => "1")
  end
  
  it "should routes to add a comment" do
    { :post => "/posts/1/comments" }.should route_to(
      :controller => "posts",
      :post_id => "1",
      :controller => "comments",
      :action => "create")
  end
  
  it "should routes to delete a comment" do
    { :delete => "/posts/1/comments/2" }.should route_to(
      :controller => "posts",
      :post_id => "1",
      :controller => "comments",
      :action => "delete",
      :id => "2")
  end
  
  
   it "should routes to search posts" do
    { :post => "/posts/search" }.should route_to(
      :controller => "posts",
      :action => "search")
  end
end
