require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  
  should route(:get, "/").to(:controller=> :static, :action => :home)
  
  context 'StaticController' do
    context 'on GET to home' do
      context 'not signed in' do
        setup do
          get :home
        end
        
        should respond_with :success
      end
      
      context 'signed in' do
        setup do
          @user = Factory :user
          sign_in @user
          get :home
        end
        
        should respond_with :success
      end
    end
  end
  
end
