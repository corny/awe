require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  context 'Project model' do
    should have_db_column :name
    should have_db_column :description
  end
  
end
