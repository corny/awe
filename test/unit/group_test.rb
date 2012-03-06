require 'test_helper'

class GroupTest < ActiveSupport::TestCase

  context 'Group model' do
    should have_db_column :name
    should have_db_column :course_id
    
    should belong_to :course
    should belong_to :project
    should have_many :users
  end
  
  context 'course instance' do
    setup do
      @course = Factory :course
      @users  = 2.times.map{ Factory :user }
      @group  = @course.groups.create_with_users(@users)
    end
    
    should 'have group assigned to course' do
      assert_equal @group, @course.groups.first
    end
    
    should 'create group' do
      assert !@group.new_record?
      assert_equal "01", @group.name
    end
    
    should 'create group with 2 users' do
      assert_equal 2, @group.users.count
    end
    
    should 'assign user to group' do
      assert @group.users.include?(@users[0])
      assert @group.users.include?(@users[1])
    end
    
  end
  
end
