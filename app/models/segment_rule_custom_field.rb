class SegmentRuleCustomField < ApplicationRecord
  belongs_to :segment_rules
  belongs_to :custom_fields
end
