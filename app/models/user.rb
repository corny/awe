class User < ActiveRecord::Base
  
  include User::Authentication
  
  belongs_to :course
  belongs_to :group
  
  default_scope :order => :name
  
  scope :without_course, where(:course_id => nil)
  scope :without_group, where(:group_id => nil)
  
  # Search in name
  scope :search, ->(term) { where "name ILIKE ?", "%" << term << "%" }
  scope :matriculation, ->(number) { where :matriculation => number }
  scope :course_id, ->(id) { where :course_id => id }
  
end
