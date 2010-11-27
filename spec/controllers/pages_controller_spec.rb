require File.dirname(__FILE__) + '/../spec_helper'

describe PagesController do
  describe "navigate to a new page" do
    before do
      @manga = Factory.create(:manga, :title => "Ashita no Joe")
      @page = Factory.create(:page, :manga => @manga, :no => 1)
    end
    
    it "should navigate back for 'previous' if that page is the first one" do
      get 'previous', :manga_id => "ashita-no-joe", :id => "1"
      response.should redirect_to [@manga,@page]
    end

    it "should navigate back for 'next' if the page is the last one" do
      get 'next', :manga_id => "ashita-no-joe", :id => "1"
      response.should redirect_to [@manga,@page]      
    end
  end
end
