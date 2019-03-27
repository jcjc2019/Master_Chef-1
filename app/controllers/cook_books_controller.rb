class CookBooksController < ApplicationController
    def index
        @cook_books = CookBook.all
    end

    def show
        @cook_book = CookBook.find(params[:id])
    end

    def new
        @cook_book = CookBook.new
        @user = current_user 
    end
 
    def create
       @user = current_user
       cook_book = CookBook.create(cook_book_params)
       @user.cook_books << cook_book
       byebug
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

    def destroy
        @cook_book = CookBook.find(params[:id])
        
        @cook_book.destroy
        #redirect to user page
        redirect_to "/users/#{@cook_book.user_id}"
    end
=end
    private

    def cook_book_params
        params.require(:cook_book).permit(:name, :user_id, :recipe_id)
    end    
end
