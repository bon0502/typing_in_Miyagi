class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :scores
  has_many :courses, through: :scores

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :nickname, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.nickname = auth.info.name
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
    end
  end
end
