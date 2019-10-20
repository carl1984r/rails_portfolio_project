class Business < ApplicationRecord
  has_many :bizlist_businesses
  has_many :bizlists, through: :bizlist_businesses
  has_many :business_reviews
  has_many :reviews, through: :business_reviews

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true

  scope :search, -> (query) { where("name LIKE ?", "%" + query + "%") }

  scope :last_day, -> { joins(:reviews).where('reviews.created_at >= ?', 1.day.ago).uniq }

  scope :user_favs, -> (query) { joins(:business_reviews).where('business_reviews.fav == ?', true).joins(:reviews).where('reviews.user_id == ?', query) }

  def overall_rating
      ((reviews.sum(&:average)/reviews.count)*10).ceil/10.0 unless reviews.empty?
  end

  def review_find(arg)
    reviews.find_review(arg.id)
  end

  def find_and_update_join(arg)
    join_model = review_find(arg)[0].assign
    join_model.fav = !join_model.fav
    join_model.save
  end

  def find_join_attribute(arg)
    review_find(arg)[0].assign.fav
  end

end
