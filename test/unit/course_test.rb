require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  context 'Course model' do
    should have_db_column :name
    should have_db_column :description
    
    should have_many :users
    should have_many :projects
    should have_many :groups
  end
  
end
