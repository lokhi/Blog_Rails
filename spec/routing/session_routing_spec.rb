require 'spec_helper'
describe SessionController do 
  it "should routes to session#new" do
    { :get => "/session/new" }.should route_to(
    :controller => "session",
    :action => "new")
  end
  
    it "should routes to session#create" do
    { :get => "/session" }.should route_to(
    :controller => "session",
    :action => "create")
  end
end
