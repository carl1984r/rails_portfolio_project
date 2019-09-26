class Review < ApplicationRecord
  has_many :business_reviews
  has_many :businesses, through: :business_reviews

  def review_average(var1, var2, var3)
    (((var1 + var2 + var3)/3.to_f)*10).ceil/10.0
  end

end
