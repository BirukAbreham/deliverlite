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
require 'rails_helper'

RSpec.describe SegmentRule, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
