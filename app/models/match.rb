# == Schema Information
#
# Table name: matches
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  match_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Match < ApplicationRecord
  validates :user_id, presence: true, uniqueness: { scope: :match_id }

  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :match,
    foreign_key: :match_id,
    class_name: :User
end
