# == Schema Information
#
# Table name: contacts
#
#  id                :bigint           not null, primary key
#  name              :string           not null
#  email             :string           not null
#  sent              :integer          default(0)
#  open              :integer          default(0)
#  delivered         :integer          default(0)
#  clicked           :integer          default(0)
#  contact_type      :string           not null
#  date_subscribed   :datetime
#  date_unsubscribed :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    contact_type { Faker::Name.name }
    # date_subscribed { Faker::Date.between(from: 5.days.ago, to: Date.today) }
  end
end
