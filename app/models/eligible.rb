class Eligible < ApplicationRecord
  validates :user_id, presence: true, uniqueness: { scope: :eligible_id }

  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :eligible,
    foreign_key: :eligible_id,
    class_name: :User
end
