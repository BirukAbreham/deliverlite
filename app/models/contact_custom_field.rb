class ContactCustomField < ApplicationRecord
  belongs_to :contacts
  belongs_to :custom_fields
end
