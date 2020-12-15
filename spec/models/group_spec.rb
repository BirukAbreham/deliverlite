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
require 'rails_helper'

RSpec.describe Group, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
