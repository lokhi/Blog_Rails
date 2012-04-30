require 'spec_helper'
describe Post do
  before(:each) do
      @p=Post.new
      @p.title="Test"
      @p.body="une chaine avec [b]un mot en gras[/b]"
      @p.save
  end
  describe "printBody" do
    it "should use use the bbcode_to_html_with_formatting method" do
      @p.body.should_receive(:bbcode_to_html_with_formatting).and_return('<p>une chaine avec <strong>un mot en gras</strong></p>')
      @p.printBody
    end
    
    
    it "should use html_safe method" do
      @p.body.bbcode_to_html_with_formatting.should_receive(:html_safe)
      @p.printBody
    end
  end
  describe "PrintDescription" do
    it "should check if the length of body is lower than 300" do
      @p.body.should_receive(:length)
      @p.printDescription
    end
    
    context "the body length is lower or egal at 300" do
      it "should use  the bbcode_to_html_with_formatting method" do
        @p.body.should_receive(:bbcode_to_html_with_formatting)
        @p.printDescription
      end
    end
    
    context "the body length is > 300" do
      before(:each) do
        @p.body="une chaine avec [b]un mot en gras[/b] une chaine avec [b]un mot en gras[/b] une chaine avec [b]un mot en gras[/b] une chaine avec [b]un mot en gras[/b] une chaine avec [b]un mot en gras[/b] une chaine avec [b]un mot en gras[/b] une chaine avec [b]un mot en gras[/b] une chaine avec [b]un mot en gras[/b]"
        @p.save
      end
      it "should take the 300 first chars" do
        @p.body.should_receive(:[])
        @p.printDescription
      end
      
      it "should return a string close by ..." do
        @p.printDescription =~ /( ...)$/
      end
    end 
  end
  
  describe "bodyWithoutBbcode" do
    it "should return the body without bbcode tags" do
      @p.bodyWithoutBbcode.should == "une chaine avec un mot en gras"
    end
  
  end
end
