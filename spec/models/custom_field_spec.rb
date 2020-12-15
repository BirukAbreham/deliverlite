# == Schema Information
#
# Table name: custom_fields
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe CustomField, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
