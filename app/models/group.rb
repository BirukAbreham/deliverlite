# == Schema Information
#
# Table name: groups
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  total        :integer          default(0)
#  active       :integer          default(0)
#  unsubscribed :integer          default(0)
#  bounced      :integer          default(0)
#  junk         :integer          default(0)
#  sent         :integer          default(0)
#  opened       :integer          default(0)
#  clicked      :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Group < ApplicationRecord
  # validations
  validates_presence_of :name

  # associations
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :campaigns
end
