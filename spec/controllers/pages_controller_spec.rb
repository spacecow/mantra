require File.dirname(__FILE__) + '/../spec_helper'

def controller_actions(controller)
  Rails.application.routes.routes.inject({}) do |hash, route|
    hash[route.requirements[:action]] = route.verb.downcase if route.requirements[:controller] == controller
    hash
  end
end

describe PagesController do
  describe "a user is logged in" do
    pages_controller_actions = controller_actions("pages")
    before(:each) do
      @manga = Factory.create(:manga, :title => "Ashita no Joe")
      @page = Factory.create(:page, :manga => @manga, :no => 1)
      sign_in Factory.create(:user)
    end

    pages_controller_actions.each do |action,request|
      it "should reach the #{action} page" do
        send("#{request}", "#{action}", :manga_id => "ashita-no-joe", :id => "1")
      end
    end
    
    after(:each) do
      response.redirect_url.should_not eq("http://test.host/users/sign_in")
    end
  end

  describe "a user is not logged in" do
    pages_controller_actions = controller_actions("pages")
    pages_controller_actions.each do |action,request|
      it "should not reach the #{action} page" do
        send("#{request}", "#{action}", :manga_id => "ashita-no-joe", :id => "1")
      end
    end
    
    after(:each) do
      response.redirect_url.should eq("http://test.host/users/sign_in")
    end
  end

  describe "navigate to a new page" do
    before(:each) do
      @manga = Factory.create(:manga, :title => "Ashita no Joe")
      @page = Factory.create(:page, :manga => @manga, :no => 1)
      @user = Factory.create(:user)
      sign_in @user
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
