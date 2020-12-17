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
class ContactCustomField < ApplicationRecord
  # validations
  validates :value, presence: true

  # associations
  belongs_to :contact
  belongs_to :custom_field
end
