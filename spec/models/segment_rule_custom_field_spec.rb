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
require 'rails_helper'

RSpec.describe SegmentRuleCustomField, type: :model do
  describe 'attribute validations' do
    it { should validate_presence_of(:value) }
  end

  describe 'assoications' do
    it { should belong_to(:segment_rule) }
    it { should belong_to(:custom_field) }
    it { should have_db_index(:segment_rule_id) }
    it { should have_db_index(:custom_field_id) }
  end
end
