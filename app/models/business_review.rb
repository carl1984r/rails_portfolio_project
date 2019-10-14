class BusinessReview < ApplicationRecord
  belongs_to :business
  belongs_to :review
end
