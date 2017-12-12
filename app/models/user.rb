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

class User < ApplicationRecord
  validates :username, :email, :password_digest, :session_token, presence: true
  validates :username, :email, uniqueness: true, length: { maximum: 20 }
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :date_of_birth, :gender, :sexual_orientation, :age_preference, presence: true

  attr_reader :password

  has_many :user_matches,
    foreign_key: :match_id,
    class_name: :Match

  has_many :matches,
    through: :user_matches,
    source: :match

  has_many :user_potentials,
    foreign_key: :potential_id,
    class_name: :Potential

  has_many :potentials,
    through: :user_potentials,
    source: :potential

  after_initialize :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user && user.valid_password?(password)
    user
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end
