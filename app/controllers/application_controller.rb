class ApplicationController < ActionController::Base
  before_action :authenticate
  private
    def current_user
       @current_user ||= User.find(session[:user_id]) if session[:user_id]   # ||= so current user is only requested one time per request
    end
    helper_method :current_user  #set up for @current_user to be accessible in views


    def authenticate
      if(session[:user_id] == nil || User.find(session[:user_id]) == nil)
        redirect_to '/sessions'
      end
    end
end
   