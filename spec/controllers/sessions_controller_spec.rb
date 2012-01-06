require 'spec_helper'

describe SessionsController do
  render_views
  describe "GET 'new'" do
    it "returns http success" do
      get :new
      response.should be_success
    end
    
  end
  describe "POST 'create'" do
    describe 'success' do
      it "should display success page" do 
        
      end
    end
    describe 'failure' do
      before(:each) do
        @attr={:email=>"", :password=>""}
      end
      
      it "should render signin page" do
        post :create, :session=>@attr
        response.should render_template('new')
      end
      it "should have the right title" do
        post :create, :session=>@attr
        response.should have_selector("title", :content=>"Sign in")
      end
      it "should display an appropriate error message" do
        post :create, :session => @attr
        flash.now[:error].should =~ /invalid/i
      end
    end
      describe "with valid email and password" do

        before(:each) do
          @user = Factory(:user)
          @attr = { :email => @user.email, :password => @user.password }
        end

        it "should sign the user in" do
          post :create, :session => @attr
          controller.current_user.should==@user
          controller.should be_signed_in
        end

        it "should redirect to the user show page" do
          post :create, :session => @attr
          response.should redirect_to(user_path(@user))
        end
      end
    end
    describe "DELETE 'destroy'" do
      before(:each) do
        @user = Factory(:user)
        @attr = { :email => @user.email, :password => @user.password }
      end
      it "should sign the user out" do
        test_sign_in(Factory(:user))
        DELETE :destroy,
        controller.should_not be_signed_in
      end
      it "should display the root page" do
        test_sign_in(Factory(:user))
        delete :destroy
        response.should redirect_to(root_path)
      end
    end
  end
