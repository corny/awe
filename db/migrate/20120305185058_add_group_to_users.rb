class AddGroupToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :group
      t.index :group_id
    end
    
    change_table :users do |t|
      t.foreign_key :groups, :dependent => :set_null
    end
    
    execute "ALTER TABLE users ADD FOREIGN KEY (group_id, course_id) REFERENCES groups (id, course_id) ON DELETE SET NULL"
    
  end
end
