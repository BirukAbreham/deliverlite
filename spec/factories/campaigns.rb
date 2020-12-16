# == Schema Information
#
# Table name: campaigns
#
#  id               :bigint           not null, primary key
#  status           :string           not null
#  scheduled_at     :datetime         not null
#  sent_at          :datetime
#  campaign_type    :string           not null
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
FactoryBot.define do
  factory :campaign do
    status { Faker::Name.name }
    scheduled_at { Faker::Date.between(from: 2.days.ago, to: Date.today)  }
    compaign_type { Faker::Name.name }
    total_recipients { Faker::Number.number(digits: 5) }
  end
end
