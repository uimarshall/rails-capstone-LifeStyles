class Article < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "author_id"
    belongs_to :category
    has_many :votes, dependent: :destroy
    validates_presence_of :title, :text, :author_id
  validates_length_of :title, :text, { minimum: 6 }
   def self.featured_article
    return unless Vote.any?

    article_id = Vote.group(:article_id).count.max_by { |_k, v| v }.first
    Article.find(article_id)
  end
end
