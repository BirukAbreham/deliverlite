# == Schema Information
#
# Table name: segment_rule_custom_fields
#
#  id               :bigint           not null, primary key
#  value            :string
#  segment_rules_id :bigint           not null
#  custom_fields_id :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class SegmentRuleCustomField < ApplicationRecord
  belongs_to :segment_rules
  belongs_to :custom_fields
end
