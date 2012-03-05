require 'test_helper'

class UserTest < ActiveSupport::TestCase

  context 'User model' do
    should have_db_column :name
    should have_db_column :email
    should have_db_column :identity_url
    should have_db_column :admin
    should have_db_index( [:email] ).unique(true)
    
    should have_db_column :course_id
    should have_db_column :group_id
    should have_db_index :course_id
    should have_db_index :group_id
  end

end
