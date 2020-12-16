# == Schema Information
#
# Table name: contact_activities
#
#  id            :bigint           not null, primary key
#  message       :text             not null
#  activity_type :string           not null
#  contact_id    :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe ContactActivity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
