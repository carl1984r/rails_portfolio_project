class Review < ApplicationRecord
  has_many :business_reviews
  has_many :businesses, through: :business_reviews
end
