class Course < ActiveRecord::Base
  
  include Course::Groups
  
  has_many :users
  has_many :projects
  
  validates :name,
    :presence   => true,
    :uniqueness => { :case_sensitive => false }
  
end
