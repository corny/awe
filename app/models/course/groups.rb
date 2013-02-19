module Course::Groups
  extend ActiveSupport::Concern
  
  included do
    has_many :groups, extend: AssociationMethods
  end
  
  module AssociationMethods
    def create_with_users(users, project=nil)
      transaction do
        raise ArgumentError, "no users given" if users.empty?
        
        # find free group name
        used_names = select('name').all.map(&:name)
        free_name  = nil
        number     = 0
        begin
          free_name = sprintf('%02d', number += 1)
        end while used_names.include?(free_name)
        
        # finally, create the group
        group = create! :name => free_name, :project => project
        
        # assign users to group
        users.each do |user|
          user.group = group
          user.save!
        end
        
        # return the group
        group
      end
    end
  end
  
end