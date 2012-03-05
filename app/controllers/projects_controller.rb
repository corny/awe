class ProjectsController < ApplicationController
  
  before_filter :authenticate_admin!, :except => [:index, :show]
  
  inherit_resources
  belongs_to :course
  
  with_role :admin
  
end
