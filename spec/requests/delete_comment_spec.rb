require 'spec_helper'

describe 'delete_comment' do
  before(:each) do
    @post = Post.create(:title => "Post1", :body => "content test")
    @comment = @post.comments.create(:name => "louis" , :content => "my comment", :post_id => @post.id)
    Capybara.current_session.driver.browser.current_session.instance_variable_get(:@rack_mock_session).cookie_jar[:stub_session]="toto"
  end
    
  it "should print a link to delete the comment on page of the post" do
    visit show_post_path(@post)
    page.should have_link('Delete' , :href => delete_comment_path(@post,@comment))
  end
  
  it "should not display the comment" do
    visit show_post_path(@post)
    click_link "Delete"
    current_path.should == show_post_path(@post)
    page.should have_no_content(@comment.name)
  end
end
