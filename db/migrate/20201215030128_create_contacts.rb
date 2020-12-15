class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :sent, default: 0
      t.integer :open, default: 0
      t.integer :delivered, default: 0
      t.integer :clicked, default: 0
      t.string :type, null: false
      t.datetime :date_subscribed, null: true
      t.datetime :date_unsubscribed, null: true

      t.timestamps
    end
  end
end
