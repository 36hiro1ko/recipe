class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.string :image
      t.string :detial_page_url

      t.timestamps null: false
    end
  end
end
