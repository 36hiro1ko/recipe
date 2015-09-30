class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      
      t.string :recipeId
      t.string :recipeTitle
      t.string :recipeUrl
      t.string :mediumImageUrl
      t.string :recipeMaterial
      t.string :recipeIndication
      

      t.timestamps null: false
      t.index :recipeId
    end
  end
end
