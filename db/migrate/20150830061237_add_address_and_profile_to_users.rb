class AddAddressAndProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :profile, :string
  end
end
