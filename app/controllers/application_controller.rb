class ApplicationController < ActionController::Base
    before_action :current_user

    def current_user
        @user = User.find(1)
    end
end
