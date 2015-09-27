class AddInstagramIdToWords < ActiveRecord::Migration
  def change
    add_column :words, :instagram_id, :string
    add_index :words, :instagram_id
  end
end
