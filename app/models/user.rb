class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = 'ゲストユーザー'
    end
  end

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
  end

  has_many :reviews
end
