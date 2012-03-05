class Group < ActiveRecord::Base
  
  has_many :users
  belongs_to :course
  
end
