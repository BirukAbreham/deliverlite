class CreateJoinTableCampaignGroup < ActiveRecord::Migration[6.0]
  def change
    create_join_table :campaigns, :groups do |t|
      t.index :campaign_id
      t.index :group_id
    end
  end
end
