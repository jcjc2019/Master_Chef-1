class UsersController < ApplicationController
    #skip_before_action :authenticate, only:[:new, :create]

    def new #display sign up form
        @user = User.new
    end

    def index
        @users = User.all
    end
    def create #sign up action
        @user = User.new(user_params)
        @user.hash_password
        #byebug
        if @user.valid?
           @user.save    
           session[:user_id] = @user.id   # so when you create a new user, they will be automatically singed in 
           redirect_to @user
        else
            render :new
        end 
    end

    def show
        @user = current_user
    end      
  
    def index
       @users = User.all
    end

    # # def show
    # #     @user = current_user if(current_user)
    # # end

    # def new 
    #     @errors = flash[:errors] || {}
    #     @user = User.new(user_params[:user])
    # end


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

    # def import
    #     User.my_import(params[:file])
    # end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :translator)
    end


end
