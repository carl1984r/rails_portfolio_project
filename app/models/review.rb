class Review < ApplicationRecord
  has_many :business_reviews
  has_many :businesses, through: :business_reviews

  scope :search, -> { order("created_at").last }

  scope :find_review, -> (query) { where("user_id LIKE ?", query) }

  def review_average(var1, var2, var3)
    (((var1 + var2 + var3)/3.to_f)*10).ceil/10.0
  end

  def assemble_review(arg, arg_2)
    self.user = arg.username
    self.user_id = arg.id
    self.average = self.review_average(self.experience, self.location, self.value)
    arg_2.reviews << self
  end

  def assign
    business_reviews[0]
  end


end
