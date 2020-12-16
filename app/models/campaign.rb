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
class Campaign < ApplicationRecord
  # validations
  validates :status, :scheduled_at, :campaign_type, :total_recipients, presence: true
  validates :sent_at, absence: true

  # assoications
  has_many :campaign_activities, dependent: :destroy
  has_and_belongs_to_many :groups
end
