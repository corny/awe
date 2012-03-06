class Group < ActiveRecord::Base
  
  belongs_to :course
  belongs_to :project
  has_many :users
  
  attr_accessor :partner_email
  
  validates :name,
    :presence   => true,
    :uniqueness => { :scope => :course_id, :case_sensitive => false }
  
end
