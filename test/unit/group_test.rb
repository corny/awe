require 'test_helper'

class GroupTest < ActiveSupport::TestCase

  context 'Group model' do
    should have_db_column :name
    should have_db_column :course_id
    
    should belong_to :course
    should have_many :users
  end
  
end
