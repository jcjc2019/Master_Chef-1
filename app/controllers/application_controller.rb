class ApplicationController < ActionController::Base
  
  private
    def current_user
       @current_user ||= User.find(session[:user_id]) if session[:user_id]   # ||= so current user is only requested one time per request
    end
    helper_method :current_user  #set up for @current_user to be accessible in views

    #def authenticate
     #   redirect_to new_session_path, aler:'Not authorized' if current_user.nil?
    #end
end
   