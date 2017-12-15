class Reject < ApplicationRecord
  validates :user_id, presence: true, uniqueness: { scope: :reject_id }

  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :reject,
    foreign_key: :reject_id,
    class_name: :User
end
