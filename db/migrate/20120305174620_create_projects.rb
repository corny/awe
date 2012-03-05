class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :course, :null => false
      t.string :name, :null => false
      t.text   :description
      t.timestamps :null => false
    end
    
    change_table :projects do |t|
      # required by foreign key constraint
      t.index [:course_id, :id], :unique => true
      
      t.index [:course_id, :name], :unique => true
      t.foreign_key :courses, :dependent => :delete
    end
    
  end
end
