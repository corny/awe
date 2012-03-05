class AddCourseToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :course
      t.index :course_id
    end
    
    change_table :users do |t|
      t.foreign_key :courses, :dependent => :set_null
    end
    
  end
end
