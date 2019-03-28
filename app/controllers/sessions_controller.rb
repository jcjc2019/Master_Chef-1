class SessionsController < ApplicationController
  skip_before_action :authenticate, only:[:new, :create, :index]
 #login page
 
 def index
 end

 def new
 end

 def create
   user = User.find_by(username: params[:username])
   if user && user.authenticate(params[:password])  
      session[:user_id] = user.id
      redirect_to user
   else
      flash.now.alert = "username or password is invalid"
      render 'new'
   end
 end

 def destroy
   session[:user_id] = nil
   redirect_to new_session_path
 end
  
end   