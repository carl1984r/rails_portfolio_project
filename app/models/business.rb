class Business < ApplicationRecord
  belongs_to :bizlist
  has_many :business_reviews
  has_many :reviews, through: :business_reviews
end
