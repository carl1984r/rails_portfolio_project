class AddColumnToBusinessReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :business_reviews, :fav, :boolean, default: false
  end
end
