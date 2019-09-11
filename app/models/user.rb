class User < ApplicationRecord
  has_secure_password

  has_many :bizlists

  validates :username, presence: { message: "cannot be empty" }
  validates :email, presence: true, uniqueness: true

  def favorite_businesses
    #self.ratings.includes(:businesses).where(:businesses => { fav: true }).uniq
  end

end
