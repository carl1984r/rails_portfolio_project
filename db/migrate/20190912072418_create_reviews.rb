class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :experience
      t.integer :location
      t.integer :value
      t.timestamps
    end
  end
end
