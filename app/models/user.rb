class User < ApplicationRecord
  has_secure_password
  validates :username,
            presence: true,
            length: { minimum: 3 },
            uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 7 }
end
