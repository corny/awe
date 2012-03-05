class UsersController < ApplicationController
  
  before_filter :authenticate_admin!
  
  inherit_resources
  
  has_scope \
    :search,
    :matriculation,
    :course_id
  
  with_role :admin
  
end
