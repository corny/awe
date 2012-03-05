class GroupsController < ApplicationController
  
  before_filter :authenticate_admin!
  
  inherit_resources
  belongs_to :course
  
  with_role :admin
  
end
