class Category < ApplicationRecord
  has_many :article_categories, foreign_key: 'category_id'
  has_many :articles, through: :article_categories, dependent: :destroy
  validates_presence_of :name, :priority
  validates_length_of :name, { minimum: 3 }
  validates_uniqueness_of :priority
end
