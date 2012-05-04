class ContactMeMailer < ActionMailer::Base
    default :from => "testblograils@gmail.com"
    default :to => "testblograils@gmail.com"
    
  def contact(name,mail,content)
    @content=content
    mail(:subject => "contact from #{name}, #{mail}")
  end
end
