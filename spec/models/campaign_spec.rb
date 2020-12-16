# == Schema Information
#
# Table name: campaigns
#
#  id               :bigint           not null, primary key
#  campaign_type    :string           not null
#  status           :string           not null
#  scheduled_at     :datetime         not null
#  sent_at          :datetime
#  compaign_type    :string           not null
#  total_recipients :integer          not null
#  is_archived      :boolean          default(FALSE)
#  open_count       :integer          default(0)
#  open_rate        :float            default(0.0)
#  click_count      :integer          default(0)
#  click_rate       :float            default(0.0)
#  bounce_count     :integer          default(0)
#  bounce_rate      :float            default(0.0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe Campaign, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
