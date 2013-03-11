class User < ActiveRecord::Base
  extend FriendlyId

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :identities, dependent: :destroy
  has_many :pages, foreign_key: :owner_id

  attr_accessible :email, :password, :password_confirmation, :remember_me

  validates :first_name, :presence => true

  friendly_id :full_name, use: :slugged

  def self.find_or_create_by_omniauth_hash(auth_hash, current_user = nil)
    identity = Identity.find_or_create_by_omniauth_hash(auth_hash)
    identity = identity.becomes(identity.type.constantize)

    user ||= identity.user || User.new

    user.first_name      ||= identity.first_name
    user.last_name       ||= identity.last_name
    user.email = identity.email if user.email.blank?
    user.profile_picture ||= identity.image
    user.save

    user.identities << identity

    user
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
