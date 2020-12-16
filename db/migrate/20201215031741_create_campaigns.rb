class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :status, null: false
      t.datetime :scheduled_at, null: false
      t.datetime :sent_at, null: true
      t.string :campaign_type, null: false
      t.integer :total_recipients, null: false
      t.boolean :is_archived, default: false
      t.integer :open_count, default: 0
      t.float :open_rate, default: 0.0
      t.integer :click_count, default: 0
      t.float :click_rate, default: 0.0
      t.integer :bounce_count, default: 0
      t.float :bounce_rate, default: 0.0

      t.timestamps
    end
  end
end
