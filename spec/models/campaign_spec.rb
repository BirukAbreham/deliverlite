# == Schema Information
#
# Table name: campaigns
#
#  id               :bigint           not null, primary key
#  status           :string           not null
#  scheduled_at     :datetime         not null
#  sent_at          :datetime
#  campaign_type    :string           not null
#  total_recipients :integer          not null
#  is_archived      :boolean          default(FALSE)
#  open_count       :integer          default(0)
#  open_rate        :float            default(0.0)
#  click_count      :integer          default(0)
#  click_rate       :float            default(0.0)
#  bounce_count     :integer          default(0)
#  bounce_rate      :float            default(0.0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe Campaign, type: :model do

  describe 'attribute validations' do
    # before { FactoryBot.create(:campaign) }

    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:scheduled_at) }
    it { should validate_absence_of(:sent_at) }
    it { should validate_presence_of(:campaign_type) }
    it { should validate_presence_of(:total_recipients) }
  end

  describe 'associations' do
    # before { FactoryBot.create(:campaign) }

    it { should have_many(:campaign_activities).dependent(:destroy) }
    it { should have_and_belong_to_many(:groups) }
  end
end
