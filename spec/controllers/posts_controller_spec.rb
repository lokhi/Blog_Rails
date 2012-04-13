require 'spec_helper'

describe PostsController do
  describe "GET 'index'" do
    before(:each) do
      @posts = [stub_model(Post,:title => "1"), stub_model(Post, :title => "2")]
      Post.stub(:all){ @posts }
    end
    it "assigns a list of posts" do
      Post.should_receive(:all).and_return(@posts)
      get 'index'
      assigns(:posts).should eq @posts
      response.should be_success
    end

    it "renders the template list" do
      get 'index'
      response.should render_template(:index)
    end
  end
  
  
  describe "GET '/posts/new'" do
    it "renders the new post form" do
      get 'new'
      response.should render_template(:new)
    end
  end
  
   
  describe "POST '/posts'" do
   before(:each) do
      @p = double(Post)
      Post.stub(:new){@p}
      @p.stub(:save)
      @params={:post=>{:title=>"title",:body=>"content"}}
    end
    
    it "should create a new post" do 
      post 'create',@params
      Post.should_receive(:new)
    end
    
    it "should save the post" do
      post 'create',@params
      @p.should_receive(:save)
    end
    
    it "should redirect to the posts page" do
       post 'create',@params
       response.should redirect_to(posts_path)
    end
  end
 
 
end

