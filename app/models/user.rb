class User < ApplicationRecord
  has_secure_password
  has_many :bizlists

  validates :name, presence: true

end
