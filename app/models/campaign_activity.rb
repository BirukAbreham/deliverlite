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
class CampaignActivity < ApplicationRecord
  # validations
  validates :message, presence: true

  # associations
  belongs_to :campaign
end
