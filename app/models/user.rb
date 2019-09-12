class User < ApplicationRecord
  has_secure_password

  has_many :bizlists

  validates :username, presence: { message: "cannot be empty" }
  validates :email, presence: true, uniqueness: true

  def favorite_businesses
    
  end

end
