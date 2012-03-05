class Course < ActiveRecord::Base
  
  has_many :users
  has_many :projects
  has_many :groups
  
  validates :name,
    :presence   => true,
    :uniqueness => { :case_sensitive => false }
  
end
