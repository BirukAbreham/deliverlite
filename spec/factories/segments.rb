# == Schema Information
#
# Table name: segments
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :segment do
    title { Faker::Name.name }
  end
end