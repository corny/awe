require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  
  should route(:get, "/courses").to(:controller=> :courses, :action => :index)
  
  context 'CoursesController' do
    context 'on GET to index' do
      context 'not signed in' do
        setup do
          get :index
        end
        
        should respond_with :redirect
      end
      
      context 'signed in' do
        setup do
          @user = Factory :user
          sign_in @user
          get :index
        end
        
        should respond_with :success
      end
    end
  end
  
end
