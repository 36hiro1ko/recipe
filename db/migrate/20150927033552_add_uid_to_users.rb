class AddUidToUsers < ActiveRecord::Migration
  def change
     add_column :users, :uid, :string
     add_column :users, :image_url, :string
     add_index :users, [:provider, :uid], unique: true
  end
end
