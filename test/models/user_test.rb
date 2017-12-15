# == Schema Information
#
# Table name: users
#
#  id                          :integer          not null, primary key
#  first_name                  :string           not null
#  last_name                   :string           not null
#  email                       :string           not null
#  img_url                     :string
#  password_digest             :string           not null
#  session_token               :string           not null
#  date_of_birth               :date
#  gender                      :string
#  sexual_orientation          :string
#  age_preference              :string
#  introduction                :text
#  dream_job                   :text
#  cooking_preference          :text
#  book_preference             :text
#  movie_preference            :text
#  pet_preference              :text
#  favorite_youtuber           :text
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
