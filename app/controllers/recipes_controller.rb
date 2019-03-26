class RecipesController < ApplicationController
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
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        #redirect to recipes page
        redirect_to recipes_path
    end

    def add_likes
        @recipe = Recipe.find(params[:id])
        @recipe.likes ||= 0  #set up default value for new recipe as 0
        @recipe.likes += 1
        @recipe.save
        redirect_to @recipe
    end
    private

    def recipe_params
        params.permit(recipe:[:name, :language, :region, :instructions, :history, :comment, :cook_time, :origin_century, :spicy_level, :sugar_level, :calories, :likes, :img_url])
    end
end
