class CookBooksController < ApplicationController
    def index
        @cook_books = CookBook.all
    end

    def show
        @cook_book = CookBook.find(params[:id])
    end

    def new
        @errors = flash[:errors] || {}
        @cook_book = CookBook.new
    end

    def create
        @cook_book = CookBook.new(cook_book_params[:cook_book])
        if @cook_book.valid?
            @cook_book.save
            redirect_to @cook_book
        else
            flash[:errors] = @cook_book.errors.messages
            render :new
        end
    end

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

    private

    def cook_book_params
        params.permit(cook_book:[:name, :user_id, :recipe_id])
    end    
end
