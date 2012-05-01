class ContactController < ActionController::Base

  def create
    ContactMailer.contact(params[:contact]).deliver
    flash[:msg] = "Thanks i will read it as soon as possible :)"
    redirect_to "/"
  end
  
end
