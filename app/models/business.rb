class Business < ApplicationRecord
  belongs_to :bizlist, optional: true
  has_many :business_reviews
  has_many :reviews, through: :business_reviews

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true

  def overall_rating
      ((reviews.sum(&:average)/reviews.count)*10).ceil/10.0 unless reviews.empty?
  end
end
