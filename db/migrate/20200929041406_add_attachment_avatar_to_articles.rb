class AddAttachmentAvatarToArticles < ActiveRecord::Migration[6.0]
  def self.up
    change_table :articles do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :articles, :avatar
  end
end
