class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
  	  t.text :text
  	  t.boolean :is_editable
  	  t.belongs_to :article,index: true  	  
  	  t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
