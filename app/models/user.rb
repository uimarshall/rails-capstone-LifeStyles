class User < ApplicationRecord
  has_secure_password
  has_many :articles, class_name: 'Article', foreign_key: 'author_id'
  has_many :votes, foreign_key: 'user_id', class_name: 'Vote', dependent: :destroy

  validates :username,
            presence: true,
            length: { minimum: 3 },
            uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 7 }
end
