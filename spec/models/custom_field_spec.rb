# == Schema Information
#
# Table name: custom_fields
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe CustomField, type: :model do
  
  describe 'attribute validation' do
    before { FactoryBot.create(:custom_field) }
    
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    before { FactoryBot.create(:custom_field) }

    it { should have_many(:contact_custom_fields).dependent(:destroy) }
    it { should have_many(:segment_rule_custom_fields).dependent(:destroy) }
  end
end
