class ContactController < ActionController::Base
  def create
    ContactMeMailer.contact(params[:contact][:name],params[:contact][:mail],params[:contact][:body]).deliver
    flash[:msg] = "Thanks i will read it as soon as possible :)"
    redirect_to "/"
  end
end
