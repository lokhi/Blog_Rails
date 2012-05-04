module SessionHelper
  require 'openssl'
  require 'base64'
 
  def decypher(key,elogin)
    clogin=Base64.urlsafe_decode64(elogin)
    privkey=OpenSSL::PKey::RSA.new(key)
    login=privkey.private_decrypt(clogin)
  end
end
