# == Schema Information
#
# Table name: users
#
#  id                          :integer          not null, primary key
#  username                    :string           not null
#  email                       :string           not null
#  img_url                     :string           not null
#  password_digest             :string           not null
#  session_token               :string           not null
#  date_of_birth               :date             not null
#  gender                      :string           not null
#  sexual_orientation          :string           not null
#  age_preference              :string           not null
#  introduction                :text
#  dream_job                   :text
#  cooking_preference          :text
#  book_preference             :text
#  movie_preference            :text
#  pet_preference              :text
#  outdoor_activity_preference :text
#  indoor_activity_preference  :text
#  inside_joke                 :text
#  intelligence_level          :text
#  what_do_you_do              :text
#  post_first_date             :text
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
