class SessionsController < ApplicationController
     skip_before_action :authenticate, only:[:new, :create]

     def new
        @errors = flash[:errors] || {}
     end

     def create
        @user = User.find_by(username: params[:username])  
        # grab username and check against the db password. If it's good, it assign the id to the coockie

        if @user.authenticate(params[:password])   
           session[:current_user_id] = @user.id
           redirect_to 
        end
     end
 
 
     def destroy
        reset_session
        redirect_to '/login' 
     end   
end   