class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  def can?(permission_key)
    roles.joins(:permissions).where(permissions: { key: permission_key }).exists?
  end

  def display_avatar_url
    avatar_url.presence || "https://api.dicebear.com/9.x/initials/svg?seed=#{email}"
  end
end