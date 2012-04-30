xml.instruct! :xml, :version =>"1.0"
xml.rss :version => "2.0" do
    xml.channel do
    xml.title "LokhiLabs Posts"
    xml.description "All posts of the blog"
    xml.link posts_path(:rss)
    
    @posts_rss.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.bodyWithoutBbcode[0..100]
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link show_post_path(post)
     end
    end
  end
end

