class CreateBizlistBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :bizlist_businesses do |t|
      t.integer :bizlist_id
      t.integer :business_id

      t.timestamps
    end
  end
end
