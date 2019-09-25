class AddColumnsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :comment, :string
    add_column :reviews, :user, :string
  end
end
