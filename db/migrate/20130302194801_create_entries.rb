class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :did

      t.timestamps
    end
  end
end
