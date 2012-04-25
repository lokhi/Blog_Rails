module SessionHelper
  require 'openssl'
  require 'base64'
 
  def decypher(key,elogin)
    clogin=Base64.urlsafe_decode64(elogin)
    privkey=OpenSSL::PKey::RSA.new(key)
    login=privkey.private_decrypt(clogin)
  end
  
  
  def current_user
    @current_user = session["current_user"]
  end
  
   def is_connected?
    !session["current_user"].nil?
  end
  
  
  def need_to_be_connected
      session["source"]=request.fullpath
      redirect_to(new_session_path) unless is_connected?
  end
end
