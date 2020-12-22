# == Schema Information
#
# Table name: segment_rules
#
#  id         :bigint           not null, primary key
#  operator   :string           not null
#  arguments  :text             not null
#  segment_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :segment_rule do
    operator { Faker::Name.name }
    arguments { Faker::Lorem.sentence(word_count: 10) }
    segment
  end
end
