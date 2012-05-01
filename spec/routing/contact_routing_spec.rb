require 'spec_helper'
describe ApplicationController do 
  it "should routes to application#contact" do
    { :post => "/contact/create" }.should route_to(
    :controller => "contact",
    :action => "create")
  end
end
