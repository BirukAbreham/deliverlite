# == Schema Information
#
# Table name: custom_fields
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :custom_field do
    name { Faker::Name.name }
  end
end
