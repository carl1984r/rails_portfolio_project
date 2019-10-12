class RemoveColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :provider, :string
    remove_column :users, :remember_token, :string
    remove_column :users, :email, :string
    remove_column :users, :uid, :string
    remove_column :users, :provider, :string
  end
end
