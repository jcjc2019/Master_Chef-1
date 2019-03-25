class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
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
        params.permit(user:[:username, :password, :translator])
    end
end
