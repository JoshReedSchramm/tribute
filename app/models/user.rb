class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :identities, dependent: :destroy

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def self.find_or_create_by_omniauth_hash(auth_hash, current_user = nil)
    identity = Identity.find_or_create_by_omniauth_hash(auth_hash)
    identity = identity.becomes(identity.type.constantize)

    user ||= identity.user || User.new

    user.first_name      ||= identity.first_name
    user.last_name       ||= identity.last_name
    user.profile_picture ||= identity.image

    user.skip_confirmation!
    user.confirm! unless user.confirmed?

    user.identities << identity

    user
  end
end
