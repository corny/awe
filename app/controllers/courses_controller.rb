class CoursesController < ApplicationController
  
  before_filter :authenticate_user!
  
  inherit_resources
  
  with_role :admin
  
end
