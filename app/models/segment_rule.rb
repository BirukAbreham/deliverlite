# == Schema Information
#
# Table name: segment_rules
#
#  id          :bigint           not null, primary key
#  operator    :string           not null
#  arguments   :text             not null
#  segments_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class SegmentRule < ApplicationRecord
  belongs_to :segments
end
