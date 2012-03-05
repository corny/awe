require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  should route(:get, "/users").to(:controller=> :users, :action => :index)
  should route(:get, "/users/id").to(:controller=> :users, :action => :show, :id => 'id')
  should route(:get, "/users/id/edit").to(:controller=> :users, :action => :edit, :id => 'id')
  should route(:put, "/users/id").to(:controller=> :users, :action => :update, :id => 'id')
  should route(:delete, "/users/id").to(:controller=> :users, :action => :destroy, :id => 'id')

  context 'StaticController' do
    context 'on GET to index' do
      context 'not signed in' do
        setup do
          get :index
        end
        
        should respond_with :redirect
      end
      
      context 'signed in as normal user' do
        setup do
          @user = Factory :user
          sign_in @user
          get :index
        end
        
        should respond_with :redirect
      end

      context 'signed in as admin user' do
        setup do
          @user = Factory :admin
          sign_in @user
          get :index
        end
        
        should respond_with :success
      end

    end
  end
  
end
