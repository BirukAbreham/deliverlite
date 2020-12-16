class CreateContactActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_activities do |t|
      t.text :message, null: false
      t.string :activity_type, null: false
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
