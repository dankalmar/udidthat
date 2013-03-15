class AddEntryIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :entry_id, :integer
  end
end
