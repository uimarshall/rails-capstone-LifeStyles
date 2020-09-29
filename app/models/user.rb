class User < ApplicationRecord
  attr_accessor :login

  
  # Don't include 'validatable', if you don't want to validate users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:validatable
  has_many :votes, dependent: :destroy

  has_many :articles
  def email_required?
    false
  end

  def email_changed?
    false
  end
  def password_required?
    false
  end

  def password_changed?
    false
  end
  
  # use this instead of email_changed? for Rails = 5.1.x
  def will_save_change_to_email?
    false
  end
   def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value OR lower(email) = :value",
      { value: login.strip.downcase}]).first
  end
     
end
