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
#  age_preference_floor        :string
#  age_preference_ceiling     :string
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

class User < ApplicationRecord
  include ActionView::Helpers::DateHelper

  validates :first_name, :last_name, :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates :first_name, :last_name, length: { maximum: 20 }
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password

  has_many :user_eligibles,
    foreign_key: :user_id,
    class_name: :Eligible

  has_many :eligibles,
    through: :user_eligibles,
    source: :eligible

  has_many :user_matches,
    foreign_key: :user_id,
    class_name: :Match

  has_many :matches,
    through: :user_matches,
    source: :match

  has_many :user_potentials,
    foreign_key: :user_id,
    class_name: :Potential

  has_many :potentials,
    through: :user_potentials,
    source: :potential

  has_many :user_rejects,
    foreign_key: :user_id,
    class_name: :Reject

  has_many :rejects,
    through: :user_rejects,
    source: :reject

  has_many :sent_messages,
    foreign_key: :sender_id,
    class_name: :Message

  has_many :received_messages,
    foreign_key: :recipient_id,
    class_name: :Message

  after_initialize :ensure_session_token

  def age
    if self.date_of_birth
      time_ago_in_words(self.date_of_birth).slice(7..8).to_i
    end
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
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
