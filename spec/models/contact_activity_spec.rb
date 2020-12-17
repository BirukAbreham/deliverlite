# == Schema Information
#
# Table name: contact_activities
#
#  id            :bigint           not null, primary key
#  message       :text             not null
#  activity_type :string           not null
#  contact_id    :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe ContactActivity, type: :model do
  describe 'attribute validation' do
    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:activity_type) }
  end

  describe 'associations' do
    it { should belong_to(:contact) }
    it { should have_db_index(:contact_id) }
  end
end
