# == Schema Information
#
# Table name: eligibles
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  eligible_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class EligibleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
