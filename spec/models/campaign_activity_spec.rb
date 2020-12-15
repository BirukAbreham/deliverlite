# == Schema Information
#
# Table name: campaign_activities
#
#  id           :bigint           not null, primary key
#  message      :text             not null
#  campaigns_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe CampaignActivity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
