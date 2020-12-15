class CreateCampaignActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :campaign_activities do |t|
      t.text :message, null: false
      t.references :campaigns, null: false, foreign_key: true

      t.timestamps
    end
  end
end
