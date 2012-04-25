class SessionController < ApplicationController
    include SessionHelper
  def new
      redirect_to("http://sauth:4567/lokhilabs/session/new?origin=/session&amp;secret=blog")
  end
  
  def create
    key=File.read(Rails.root.join('app/assets/private.pem'))
    session["current_user"] = decypher(key,params["login"])
    redirect_to posts_path
  end
  
  def delete
    session["current_user"] = nil
    cookies[:stub_session] = nil if Rails.env.test?
    redirect_to posts_path
  end
end
