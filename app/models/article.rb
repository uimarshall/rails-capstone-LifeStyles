class Article < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :votes, foreign_key: 'article_id', class_name: 'Vote', dependent: :destroy
end
