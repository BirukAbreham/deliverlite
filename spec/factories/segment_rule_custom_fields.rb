# == Schema Information
#
# Table name: segment_rule_custom_fields
#
#  id              :bigint           not null, primary key
#  value           :string           not null
#  segment_rule_id :bigint           not null
#  custom_field_id :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :segment_rule_custom_field do
    value { "Favourite Color" }
  end
end
