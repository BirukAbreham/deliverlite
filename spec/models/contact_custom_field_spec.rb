# == Schema Information
#
# Table name: contact_custom_fields
#
#  id              :bigint           not null, primary key
#  value           :string           not null
#  contact_id      :bigint           not null
#  custom_field_id :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe ContactCustomField, type: :model do
  describe 'attribute validation' do
    it { should validate_presence_of(:value) }
  end

  describe 'associations' do
    it { should belong_to(:contact) }
    it { should belong_to(:custom_field) }
    it { should have_db_index(:contact_id) }
    it { should have_db_index(:custom_field_id) }
  end
end
