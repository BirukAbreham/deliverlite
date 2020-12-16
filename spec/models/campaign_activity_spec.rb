# == Schema Information
#
# Table name: campaign_activities
#
#  id          :bigint           not null, primary key
#  message     :text             not null
#  campaign_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe CampaignActivity, type: :model do
  describe 'attribute validations' do
    it { should validate_presence_of(:message) }
  end

  describe 'associations' do
    it { should belong_to(:campaign) }
    it { should have_db_index(:campaign_id) }
  end
end
