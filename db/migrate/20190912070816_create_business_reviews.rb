class CreateBusinessReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :business_reviews do |t|
      t.integer :business_id
      t.integer :review_id
      t.timestamps
    end
  end
end
