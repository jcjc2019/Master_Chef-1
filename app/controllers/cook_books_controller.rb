class CookBooksController < ApplicationController
    before_action :authenticate

    def index
        @cook_books = CookBook.all
    end

    def show
        @user = current_user
        @cook_book = CookBook.find(params[:id])
        #byebug
    end  

    def new
        @user = current_user 
    end
 
    def create
       @user = current_user
       @cook_book = CookBook.new(cook_book_params)
       @user.cook_books << @cook_book
       #byebug
       redirect_to user_path(@user)
    end

    def edit
         @user = current_user
         @cook_book = CookBook.find(params[:id])
        #byebug
        
    end

    def update
        @user = current_user
        @cook_book = CookBook.find(params[:id])
        rc = Recipe.find(params[:cook_book][:recipe_ids].to_i)
        @cook_book.recipes << rc
        redirect_to @cook_book
        #byebug
    end

     
    def destroy
        @user = current_user
        @cook_book = CookBook.find(params[:id]) #delete cook_book association
        @user.cook_books.delete(@cook_book)
        #byebug
        redirect_to user_path(@user)
    end

    private

    def cook_book_params
        params.require(:cook_book).permit(:name, :user_id, :recipe_ids=> [])
    end    
end

 