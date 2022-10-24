class SessionsController < ApplicationController

    def new
        redirect_to new_user_url
    end

    def create
        @user = User.find_by_credentials(username,password)
        session[:session_token] = @user.reset_session_token! # maybe @session_token or self.session_token
        redirect_to cats_url
    end

    def destroy
        current_user.reset_session_token!
        session[:session_token] = nil # maybe @session_token or self.session_token
    end

end