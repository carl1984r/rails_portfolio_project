class RemoveColumnFromBusinesses < ActiveRecord::Migration[5.2]
  def change
    remove_column :businesses, :bizlist_id, :integer
  end
end
