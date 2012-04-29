require 'spec_helper'

describe PostsController do
  before(:each) do
    session["current_user"] = "toto"
  end
  
  describe "GET 'index'" do
    before(:each) do
      @posts = [stub_model(Post,:title => "1"), stub_model(Post, :title => "2")]
      Post.stub(:paginate){ @posts }
    end
    it "assigns a list of posts" do
      Post.should_receive(:paginate).and_return(@posts)
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
      Post.should_receive(:new)
      post 'create',@params
    end
    
    it "should save the post" do
      @p.should_receive(:save)
      post 'create',@params
    end
    
    it "should create a flash message" do
     post 'create',@params
     flash[:msg].should == "Post was created with success :) !"
    end
    
    it "should redirect to the posts page" do
       post 'create',@params
       response.should redirect_to(posts_path)
    end
  end
 
 
 describe "GET '/posts/:id/edit'" do
   it "should render the form of the post" do
     get 'edit' , "id"=>"1"
     response.should render_template(:edit)
   end
 end
 
  describe "PUT '/posts/:id'" do
    before(:each) do
      @p = double(Post)
      Post.stub(:find_by_id){@p}
      @p.stub(:update_attributes)
      @params={:id=>1,:post=>{:title=>"Newtitle",:body=>"Newcontent"}}
    end
    it "should retrieve the post" do
      Post.should_receive(:find_by_id)
      put 'update', @params
    end
   
    it "should update the post" do
      @p.should_receive(:update_attributes)
      put 'update', @params
    end
    
    it "should create a flash message" do
     put 'update',@params
     flash[:msg].should == "Post was updated with success :) !"
    end
    it "should redirect to the posts page" do
      put 'update', @params
      response.should redirect_to(posts_path)
    end
 end
 
 
 describe "GET '/posts/:id'" do
   before(:each) do
      @p = double(Post)
      Post.stub(:find_by_id){@p}
      @params={:id=>1}
    end
   it "should retrieve the post thanks to the id" do
     Post.should_receive(:find_by_id)
     get 'show', @params
   end
   
   it "should render the post page" do
     get 'show', @params
     response.should render_template(:show)
   end
 end
 
 describe "DELETE '/posts/:id'" do
   before(:each) do
      @p = double(Post)
      Post.stub(:find_by_id){@p}
      @p.stub(:destroy)
      @params={:id=>1}
    end
   it "should retrieve the post thanks to the id" do
     Post.should_receive(:find_by_id)
     delete 'delete', @params
   end
   
   it "should destroy the post" do
     @p.should_receive(:destroy)
     delete 'delete',@params
   end
   
    it "should render the post page" do
     delete 'delete',@params
     response.should redirect_to(posts_path)
   end
 end
 
  describe "POST '/posts/search'" do
   before(:each) do
      @p = double(Post)
      Post.stub(:where){@p}
      @params={:search=>"hello"}
      @p.stub(:empty?){false}
    end
   it "should search post content the params" do
     Post.should_receive(:where)
     post 'search', @params
   end
   
    it "should render the post page" do
      post 'search',@params
      response.should render_template('posts/index')
   end
   
   context "the search return nothing" do
     before(:each) do 
      @p.stub(:empty?){true}
     end
     it "should create a flash message with the message" do
      post 'search', @params
      flash[:search].should == "No posts found. Try a different search ?"
     end
   end
 
 end
 
end

