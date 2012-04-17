require 'spec_helper'

describe CommentsController do
  describe "POST '/posts/post_id/comments'" do
   before(:each) do
      @p = stub_model(Post,:title => "1",:body=>"content")
      Post.stub(:find_by_id){@p}
      @c=double(Comment)
      @p.stub(:comments){@c}
      @c.stub(:create)
      @params={:post_id=> @p.id,:comment=>{:name=>"louis",:content=>"mycomment"}}
     
    end
    
    it"should retrieve the post" do
      Post.should_receive(:find_by_id)
      post 'create',@params
    end
    
    it "should create a new comment" do 
      @c.should_receive(:create)
      post 'create',@params
    end
    
    it "should redirect to the page of the post" do
       post 'create',@params
       response.should redirect_to(show_post_path(@p))
    end
  end
  
  
 describe "DELETE '/posts/:post_id/comments/id'" do
   before(:each) do
      @p = double(Post)
      Post.stub(:find_by_id){@p}
      @c=double(Comment)
      @p.stub(:comments){@c}
      @c.stub(:find){@c}
      @c.stub(:destroy)
      @params={:post_id=>1,:id=>1}
    end
    it "should find the post thanks to the id" do
      Post.should_receive(:find_by_id)
      delete 'delete', @params
    end
   
    it "should find the comment" do
      @p.should_receive(:comments)
      @c.should_receive(:find)
      delete 'delete',@params
    end
   
     
   
    it "should destroy the comment" do
      @c.should_receive(:destroy)
      delete 'delete',@params
    end
   
    it "should render the post page" do
     delete 'delete',@params
     response.should redirect_to(show_post_path(@p))
   end
 
 end
end
