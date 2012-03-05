class Course < ActiveRecord::Base
  
  has_many :users
  has_many :projects
  
  has_many :groups do
    def create_with_users(name, users)
      transaction do
        group = create! :name => name
        users.each do |user|
          user.group = group
          user.save!
        end
        group
      end
    end
  end
  
  validates :name,
    :presence   => true,
    :uniqueness => { :case_sensitive => false }
  
end
