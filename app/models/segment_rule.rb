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
class SegmentRule < ApplicationRecord
  # validations
  validates :operator, :arguments, presence: true

  # associations
  belongs_to :segment
  has_many :segment_rule_custom_fields, dependent: :destroy
  has_many :segment_fields, through: :segment_rule_custom_fields, source: :custom_field
end
