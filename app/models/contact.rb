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
#  contact_type      :string           not null
#  date_subscribed   :datetime
#  date_unsubscribed :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Contact < ApplicationRecord
  # validations
  validates :name, :email, :contact_type, presence: true
  validates :date_subscribed, :date_unsubscribed, absence: true
  validates_uniqueness_of :email

  # validate association
  validates_associated :groups

  # associations
  has_many :contact_activities, dependent: :destroy
  has_many :contact_custom_fields, dependent: :destroy
  has_many :contact_fields, through: :contact_custom_fields, source: :custom_field
  has_and_belongs_to_many :groups

  def self.activities(id)
    contact = Contact.find(id)
    { contact: contact, activities: contact.contact_activities }
  end

  def self.contact_groups(id)
    contact = Contact.find(id)
    { contact: contact, groups: contact.groups }
  end
end
