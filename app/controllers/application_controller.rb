class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionHelper
  
  private
    if Rails.env.test?
      before_filter :stub_current_user
      def stub_current_user
        session["current_user"]= cookies[:stub_session] if cookies[:stub_session]
      end
    end
end
