# == Schema Information
#
# Table name: contact_custom_fields
#
#  id               :bigint           not null, primary key
#  value            :string           not null
#  contacts_id      :bigint           not null
#  custom_fields_id :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe ContactCustomField, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
