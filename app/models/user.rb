class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: {maximum: Settings.maximum_name}

  validates :email, presence: true, length: {maximum: Settings.maximum_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

  has_secure_password

  validates :password, presence: true, length: {minimum: Settings.minimum_pass}

end

