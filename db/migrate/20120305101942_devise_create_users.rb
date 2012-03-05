class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :name
      t.string :email
      t.string :identity_url
      t.integer :matriculation
      t.string :degree_program
      t.timestamps :null => false
    end

    add_index :users, :email, :unique => true
    add_index :users, :identity_url, :unique => true
  end
end
