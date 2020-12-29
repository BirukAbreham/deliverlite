# == Schema Information
#
# Table name: contact_activities
#
#  id            :bigint           not null, primary key
#  message       :text             not null
#  activity_type :string           not null
#  contact_id    :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :contact_activity do
    message { Faker::Lorem.sentence(word_count: 10) }
    activity_type { ['open', 'click', 'junk', 'bounce', 'unsubscribe', 'forward'].sample }
    contact
  end
end
