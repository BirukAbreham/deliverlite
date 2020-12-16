# == Schema Information
#
# Table name: contacts
#
#  id                :bigint           not null, primary key
#  name              :string           not null
#  email             :string           not null
#  sent              :integer          default(0)
#  open              :integer          default(0)
#  delivered         :integer          default(0)
#  clicked           :integer          default(0)
#  type              :string           not null
#  date_subscribed   :datetime
#  date_unsubscribed :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe 'attribute validations' do
    before { FactoryBot.create(:contact) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:contact_type) }
    it { should validate_absence_of(:date_subscribed) }
    it { should validate_absence_of(:date_unsubscribed) }
  end

  describe 'associations' do
    before { FactoryBot.create(:contact) }
    
    it { should have_many(:contact_activities).dependent(:destroy) }
    it { should have_many(:contact_custom_fields).dependent(:destroy) }
    it { should have_and_belongs_to_many(:groups) }
  end
end
