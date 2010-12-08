require File.dirname(__FILE__) + '/../spec_helper'

describe PagesController do
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

  describe "a user not logged in" do
    before(:each) do
      @manga = Factory.create(:manga, :title => "Ashita no Joe")
      @page = Factory.create(:page, :manga => @manga, :no => 1)
    end

    it "should not reach the show page" do
      get "show", :manga_id => "ashita-no-joe", :id => "1"
    end
    it "should not reach the new page" do
      get "new", :manga_id => "ashite-no-joe"
    end
    it "should not reach the edit page" do
      get "edit", :manga_id => "ashita-no-joe", :id => "1"
    end
    it "should not reach the create page" do
      post "create", :manga_id => "ashita-no-joe"
    end
    it "should not reach the update page" do
      put "update", :manga_id => "ashita-no-joe", :id => "1"
    end
    it "should not reach the destroy page" do
      delete "destroy", :manga_id => "ashita-no-joe", :id => "1"
    end

    after(:each) do
      response.should redirect_to new_user_session_path
    end
  end

  describe "a logged in user" do
    before(:each) do
      @manga = Factory.create(:manga, :title => "Ashita no Joe")
      @page = Factory.create(:page, :manga => @manga, :no => 1)
      sign_in Factory.create(:user)
    end

    it "should reach the show page" do
      get :show, :manga_id => "ashita-no-joe", :id => "1"
    end
    it "should reach the new page" do
      get :new, :manga_id => "ashita-no-joe"
    end
    it "should reach the edit page" do
      get :edit, :manga_id => "ashita-no-joe", :id => "1"
    end

    after(:each) do
      response.should be_success
    end
  end

  describe "a page" do
    before(:each) do
      @page = mock_model(Page, :update_attributes => true,
                         :destroy => true, :save => true)
      pages_assoc = mock("Pages assoc")
      pages_assoc.stub_chain(:where, :first).and_return @page
      pages_assoc.stub!(:build).and_return @page

      @manga = mock_model(Manga, :pages => pages_assoc)
      Manga.stub_chain(:where, :first).and_return @manga

    end

    describe "with id" do
      describe "a logged in user" do
        before(:each) do
          sign_in Factory.create(:user)
        end

        it "should reach the update page" do
          put :update, :manga_id => "ashita-no-joe", :id => "1"
        end
        it "should reach the destroy page" do
          delete :destroy, :manga_id => "ashita-no-joe", :id => "1"
        end

        after(:each) do
          response.should redirect_to @manga
        end
      end
    end

    describe "without id" do
      describe "a logged in user" do
        before(:each) do
          sign_in Factory.create(:user)
        end

        it "should reach the create page" do
          post :create, :manga_id => "ashita-no-joe"
          response.should redirect_to @manga
        end
      end
    end
  end
end
