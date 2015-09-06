class CreateMailboxes < ActiveRecord::Migration
  def change
    create_table :mailboxes do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :recipient_id
      t.text :message

      t.timestamps null: false
      
      t.index [:user_id, :recipient_id, :created_at]
    end
  end
end
