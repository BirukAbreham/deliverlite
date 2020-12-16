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
  describe 'attribute validations' do
    it { should validate_presence_of(:operator) }
    it { should validate_presence_of(:arguments) }
  end

  describe 'associations' do
    it { should belong_to(:segment) }
    it { should have_db_index(:segment_id) }
  end
end
