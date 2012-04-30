require 'bb-ruby'
class Post < ActiveRecord::Base
  has_many :comments, :dependent => :delete_all
  
  def printBody
    body.bbcode_to_html_with_formatting.html_safe
  end
  
  
  def printDescription
    if body.length <= 300
      body.bbcode_to_html_with_formatting.html_safe
    else
      text="#{body[0..299]} ..."
      text.bbcode_to_html_with_formatting.html_safe
    end
  end
  
  def bodyWithoutBbcode
    body.gsub(/\[[a-zA-z09=_\/:,\.-]*\]/,"")
  end
end
