class Group < ActiveRecord::Base
  
  belongs_to :course
  belongs_to :project
  has_many :users
  
  validates :name,
    :presence   => true,
    :uniqueness => { :scope => :course_id, :case_sensitive => false }
  
end
