class AddFieldsToUser < ActiveRecord::Migration
  
  def self.up
  	add_column :users, :first_name, :string,limit: 70
  	add_column :users, :last_name, :string, limit: 70
  	add_column :users, :phone_number ,:string, limit: 15
  	add_column :users, :is_active, :boolean, default: false
  end

  def self.down
  	remove_column :users, :is_active, :boolean
  	remove_column :users, :phone_number ,:string, limit: 15  	
  	remove_column :users, :last_name, :string, limit: 70
  	remove_column :users, :first_name, :string,limit: 70
   end
end
