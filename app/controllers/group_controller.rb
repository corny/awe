class GroupController < ApplicationController
  
  before_filter :authenticate_user!
  
  def show
    @group = current_user.group
  end
  
  def new
    build_resource
  end
  
  def create
    email = build_resource.partner_email
    user  = User.find_by_email(email)
    
    if user && user != current_user
      # create group with assigned project
      project = Project.find(@group.project_id)
      project.course.groups.create_with_users([current_user, user], project)
      
      flash[:success] = "Group created successfully"
      redirect_to :group
    else
      flash[:error] = "User #{email} is not available"
      render :new
    end
  end
  
  protected
  
  def build_resource
    @group ||= current_user.build_group(params[:group])
  end
  
end
