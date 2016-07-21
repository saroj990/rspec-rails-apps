class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string  :email
      t.string  :facebook_url
      t.string  :twitter_handle    
      t.timestamps null: false
    end
  end
end
