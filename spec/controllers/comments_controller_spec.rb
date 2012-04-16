require 'spec_helper'

describe CommentsController do
  describe "POST '/posts/post_id/comments'" do
   before(:each) do
      @p = stub_model(Post,:title => "1",:body=>"content")
      Post.stub(:find_bi_id){@p}
      @c=double(Comment)
      @p.comments.stub(:new){@c}
      @c.stub(:save)
      @params={:post_id=> @p.id,:comment=>{:name=>"louis",:content=>"mycomment"}}
     
    end
    
    it"should retrieve the post" do
      Post.should_receive(:find_by_id)
      post 'create',@params
    end
    
    it "should create a new comment" do 
      @p.comments.should_receive(:new)
      post 'create',@params
    end
    
    it "should save the comment" do
      @c.should_receive(:save)
      post 'create',@params
    end
    
    
    it "should redirect to the page of the post" do
       post 'create',@params
       response.should redirect_to(show_post_page(@p))
    end
  end
end
