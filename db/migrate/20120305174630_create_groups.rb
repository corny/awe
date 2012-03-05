class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :course, :null => false
      t.references :project
      t.string :name, :null => false
      t.timestamps :null => false
    end
    
    change_table :groups do |t|
      # required by foreign key constraint
      t.index [:course_id, :id], :unique => true
      
      t.index [:course_id, :name], :unique => true
      t.foreign_key :courses, :dependent => :delete
    end
    
    execute "ALTER TABLE groups ADD FOREIGN KEY (project_id, course_id) REFERENCES projects (id, course_id) ON DELETE SET NULL"
    
  end
end
