class Article < ApplicationRecord
  attr_accessor :category_id
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :article_categories, foreign_key: 'article_id'
  has_many :categories, through: :article_categories, dependent: :destroy
  has_many :votes, foreign_key: 'article_id', class_name: 'Vote', dependent: :destroy
  validates_presence_of :title, :text, :author_id, :image
  validates_length_of :title, :text, { minimum: 5 }

  def self.featured_article
    return unless Vote.any?

    # Find the article with highest vote
    article_id = Vote.group(:article_id).count.max_by { |_k, v| v }.first
    Article.find(article_id)
  end
end
