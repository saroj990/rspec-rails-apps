class AddFieldsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :likes, :integer
    add_column :articles, :shares, :integer
  end
end
