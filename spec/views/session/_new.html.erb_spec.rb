require 'spec_helper'

describe "session/new" do
  it "should display the link to the Sauth" do
     render :partial => "session/new"
    rendered.should have_selector("a[href='/session/new']")
  end
end
