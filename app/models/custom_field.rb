# == Schema Information
#
# Table name: custom_fields
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CustomField < ApplicationRecord
  # validation
  validates :name, presence: true

  # associations
  has_many :contact_custom_fields, dependent: :destroy
  has_many :segment_rule_custom_fields, dependent: :destroy
  has_many :contacts, through: :contact_custom_fields, source: :contact
  has_many :segment_rules, through: :segment_rule_custom_fields, source: :segment_rule
end
