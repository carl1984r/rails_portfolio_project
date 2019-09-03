class User < ApplicationRecord
  has_secure_password
  has_many :bizlists

  validates :username, presence: { message: "cannot be empty." }
  validates :email, presence: { message: "required." }
  validates :email, uniqueness: { message: "already used. Try another email." }

end
