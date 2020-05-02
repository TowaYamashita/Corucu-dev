class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :substitutes, dependent: :destroy
  has_many :add_examinations, dependent: :destroy
  
  def self.guest
    find_or_create_by!(email: 'guest-browse@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "ゲストユーザ(閲覧用)"
      user.status_id = 3
      user.confirmed_at = Time.now
    end
  end
end
