class AddReadToMailboxes < ActiveRecord::Migration
  def change
    add_column :mailboxes, :read, :integer
  end
end
