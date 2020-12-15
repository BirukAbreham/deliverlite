class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.integer :total, default: 0
      t.integer :active, default: 0
      t.integer :unsubscribed, default: 0
      t.integer :bounced, default: 0
      t.integer :junk, default: 0
      t.integer :sent, default: 0
      t.integer :opened, default: 0
      t.integer :clicked, default: 0

      t.timestamps
    end
  end
end
