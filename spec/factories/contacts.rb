FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    contact_type { Faker::Name.name }
  end
end