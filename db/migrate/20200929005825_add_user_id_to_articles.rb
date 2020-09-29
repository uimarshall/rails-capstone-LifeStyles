class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :author_id, :integer
  end
end
