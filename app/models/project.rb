class Project < ActiveRecord::Base
  
  belongs_to :course
  has_one :group
  has_many :users, :through => :group
  
  validates :name,
    :presence   => true,
    :uniqueness => { :scope => :course_id, :case_sensitive => false }
  
  scope :available, where("id NOT IN (SELECT project_id FROM groups)")
  
end
