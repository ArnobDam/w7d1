class SessionsController < ApplicationController

    def new
        render new_user_url
    end

    def create
        @user = User.find_by_credentials(username,password)
        @session_token = @user.reset_session_token!
        redirect_to cats_url
    end

    # def destroy
    # end

end