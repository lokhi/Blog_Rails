class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery
  #include SessionHelper
  
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
  
  
  
  private
    if Rails.env.test?
      before_filter :stub_current_user
      def stub_current_user
        session["current_user"]= cookies[:stub_session] if cookies[:stub_session]
      end
    end
end
