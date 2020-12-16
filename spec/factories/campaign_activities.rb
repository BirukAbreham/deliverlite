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
FactoryBot.define do
  factory :campaign_activity do
    message { Faker::Lorem.sentence(word_count: 10) }
  end
end