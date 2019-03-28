class RecipesController < ApplicationController
    skip_before_action :authenticate, only:[:index]

    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @errors = flash[:errors] || {}
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params[:recipe])
        if @recipe.valid?
            @recipe.save
            redirect_to @recipe
        else
            flash[:errors] = @recipe.errors.messages
            render :new
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
        @recipes = Recipe.all
        @errors = flash[:errors] || {}
    end

    def update
        @recipe = Recipe.find(params[:id])
        @recipe.assign_attributes(recipe_params[:recipe])
        if @recipe.valid?
            @recipe.save
            redirect_to @recipe
        else
            flash[:errors] = @recipe.errors.messages  
            render :edit
        end
    end

    def destroy
        @user = current_user
        @recipe = Recipe.find(params[:id])
        @user.cook_books.select do |cook_book|
           if cook_book.recipes.include?(@recipe)
            cook_book.recipes.delete(@recipe)            
            #byebug
            redirect_to "/cook_books/#{cook_book.id}"
           end
        end
       
    end

    

    def add_likes 
        @recipe = Recipe.find(params[:id])
        #byebug
        @recipe.likes ||= 0  #set up default value for new recipe as 0
        @recipe.likes += 1
        @recipe.save
        #byebug
        redirect_to @recipe 
    end
    private

    def recipe_params
        params.permit(recipe:[:name, :language, :region, :instructions, :history, :comment, :cook_time, :origin_century, :spicy_level, :sugar_level, :calories, :likes, :img_url, :ingredient_list, :ingredient, {ingredient_ids:[]}, :ingredient_ids])
    end
end
