# == Schema Information
#
# Table name: potentials
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  potential_id     :integer          not null
#  do_you_like_them :boolean          not null
#  do_they_like_you :boolean          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Potential < ApplicationRecord
  validates :user_id, presence: true, uniqueness: { scope: :potential_id }

  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :potential,
    foreign_key: :potential_id,
    class_name: :User
end
