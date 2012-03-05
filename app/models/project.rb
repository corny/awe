class Project < ActiveRecord::Base
  
  belongs_to :course
  has_one :group
  has_many :users, :through => :group
  
  validates :name,
    :presence   => true,
    :uniqueness => { :scope => :course_id, :case_sensitive => false }
  
end
