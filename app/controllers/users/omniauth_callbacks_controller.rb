class Users::OmniauthCallbacksController < ApplicationController
  include Devise::Controllers::Rememberable

  Devise.omniauth_providers.each do |provider|
    define_method(provider) { default }
  end

  private
  def default
    user = User.find_or_create_by_omniauth_hash(request.env['omniauth.auth'], current_user)
    remember_me(user)
    sign_in_and_redirect(user, event: :authentication)
  end
end
