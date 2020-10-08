class Article < ApplicationRecord
  attr_accessor :category_id
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :article_categories, foreign_key: 'article_id'
  has_many :categories, through: :article_categories, dependent: :destroy
  has_many :votes, foreign_key: 'article_id', class_name: 'Vote', dependent: :destroy
end
