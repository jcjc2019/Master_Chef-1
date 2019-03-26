class UsersController < ApplicationController
    skip_before_action :authenticate, only:[:new, :create]

    def current_user
        User.find(session[:current_user_id]) if(session[:current_user_id])
    end

    def show
        @user = current_user if(current_user)
    end

    def new 
        @errors = flash[:errors] || {}
        @user = User.new
    end

    def create
        @user = User.new(user_params[:user])
 
        if @user.valid?
            @user.save
            redirect_to @user
        else
            flash[:errors] = @user.errors.messages
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
        @users = User.all
        @errors = flash[:errors] || {}
    end

    def update
        @user = User.find(params[:id]) 
        @user.assign_attributes(user_params[:user])
        if @user.valid?
            @user.save
            redirect_to @user
        else
            flash[:errors] = @user.errors.messages
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        #redirect to login page
        redirect_to '/sessions'
    end

    private

    def user_params
        params.permit(user:[:username, :password_digest, :translator])
    end
end
