class CoursesController < ApplicationController
  
  before_filter :authenticate_admin!
  
  inherit_resources
  
  with_role :admin
  
end
