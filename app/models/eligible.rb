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

class Eligible < ApplicationRecord
  validates :user_id, presence: true, uniqueness: { scope: :eligible_id }

  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :eligible,
    foreign_key: :eligible_id,
    class_name: :User
end
