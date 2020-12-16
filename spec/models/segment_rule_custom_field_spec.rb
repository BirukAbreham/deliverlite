# == Schema Information
#
# Table name: segment_rule_custom_fields
#
#  id              :bigint           not null, primary key
#  value           :string
#  segment_rule_id :bigint           not null
#  custom_field_id :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe SegmentRuleCustomField, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
