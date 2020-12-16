# == Schema Information
#
# Table name: segments
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Segment, type: :model do

  describe 'attribute validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'associations' do
    it { should have_many(:segment_rules).dependent(:destroy) }
  end
end
