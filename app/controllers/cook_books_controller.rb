class CookBooksController < ApplicationController
    def index
        @cook_books = CookBook.all
    end

    def show
        @user = current_user
        @cook_book = CookBook.find(params[:id])
    end 

    def new
        @user = current_user 
        #@cook_book = CookBook.new(cook_book_params)
    end
 
    def create
       @user = current_user
       @cook_book = CookBook.new(cook_book_params)
       @user.cook_books << @cook_book
       #byebug
       redirect_to user_path(@user)
    end

    def update
        @user = current_user
        cook_book = CookBook.find(params[:id])
        cook_book.save
        redirect_to 
    end

     
    def destroy
        @user = current_user
        @cook_book = CookBook.find(params[:id])
        @user.cook_books.delete(@cook_book)
        redirect_to user_path(@user)
    end
=begin
    def edit
        @cook_book = CookBook.find(params[:id])
        @cook_books = CookBook.all
        @errors = flash[:errors] || {}
    end


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
        params.require(:cook_book).permit(:name)
    end    
end
