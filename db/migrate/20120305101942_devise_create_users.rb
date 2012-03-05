class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :name
      t.string :email
      t.string :identity_url
      t.integer :matriculation
      t.string :degree_program
      t.boolean :admin, :null => false, :default => false
      t.timestamps :null => false
    end
    
    change_table :users do |t|
      t.index :email, :unique => true
      t.index :identity_url, :unique => true
      t.index :matriculation
    end
  end
end
