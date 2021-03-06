# == Schema Information
#
# Table name: segments
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Segment < ApplicationRecord
  # validation
  validates :title, presence: true

  # associations
  has_many :segment_rules, dependent: :destroy
end
