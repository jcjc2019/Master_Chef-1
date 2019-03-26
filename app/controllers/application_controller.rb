class ApplicationController < ActionController::Base
    # before_action :authenticate
    # def authenticate
    #     if session[:current_user_id] == nil || User.find(session[:current_user_id]) == nil  # this is the senario where a user hasn't logged in. This is not necessary after sessions.
    #       redirect_to '/login'
    #     end
    # end
end
  