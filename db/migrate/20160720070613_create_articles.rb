class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :body
      t.string :title
      t.datetime :published_on
      t.boolean :is_published
      t.boolean :is_commentable        
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
