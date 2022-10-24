class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        @current_user ||= user.find_by(session_token: @session_token)
    end
end