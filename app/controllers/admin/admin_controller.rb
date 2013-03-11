module Admin
  class AdminController < ApplicationController
    before_filter :requires_admin

    protected
      def requires_admin
        unless user_signed_in? && current_user.admin?
          render template: "errors/unauthorized", layout: "application", status: 401 and return false
        end
      end
  end
end
