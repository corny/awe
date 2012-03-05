class Project < ActiveRecord::Base
  
  belongs_to :course
  
  has_one :group
  has_many :users, :through => :group
  
end
