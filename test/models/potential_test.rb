# == Schema Information
#
# Table name: potentials
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  potential_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class PotentialTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
