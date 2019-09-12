class AddColumnToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :bizlist_id, :integer
  end
end
