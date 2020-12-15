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
#  type              :string           not null
#  date_subscribed   :datetime
#  date_unsubscribed :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'rails_helper'

RSpec.describe Contact, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
