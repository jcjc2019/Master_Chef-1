class CookBooksController < ApplicationController
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
        #redirect_to cook_book_path(cook_book)
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
        @cook_book = CookBook.find(params[:id])
        @user.cook_books.delete(@cook_book)
        redirect_to user_path(@user)
    end
=begin


    def update
        @cook_book = CookBook.find(params[:id])
        @cook_book.assign_attributes(cook_book_params[:cook_book])
        if @cook_book.valid?
            @cook_book.save
            redirect_to @cook_book
        else
            flash[:errors] = @cook_book.errors.messages
            render :edit
        end
    end

=end
    private

    def cook_book_params
        params.require(:cook_book).permit(:name, :user_id, :recipe_ids=> [])
    end    
end

 