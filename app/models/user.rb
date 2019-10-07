class User < ApplicationRecord
  has_secure_password

  has_many :bizlists

  validates_length_of :username, minimum: 4, maximum: 16
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

end
