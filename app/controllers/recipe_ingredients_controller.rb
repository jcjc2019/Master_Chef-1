class RecipeIngredientsController < ApplicationController
    def index
        @recipe_ingredients = RecipeIngredient.all
    end

    def show
        @recipe_ingredient = RecipeIngredient.find(params[:id])
    end
    
   #edit, update, new, create, not necessary    

    def new
        @errors = flash[:errors] || {}
        @recipe_ingredient = RecipeIngredient.new
    end

    def create
        @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params[:recipe_ingredient])
        if @recipe_ingredient.valid?
            @recipe_ingredient.save
            redirect_to @recipe_ingredient
        else
            flash[:errors] = @recipe_ingredient.errors.messages
            render :new
        end
    end

    def edit
        @recipe_ingredient = RecipeIngredient.find(params[:id])
        @recipe_ingredients = RecipeIngredient.all
        @errors = flash[:errors] || {}
    end

    def update
        @recipe_ingredient = RecipeIngredient.find(params[:id])
        @recipe_ingredient.assign_attributes(recipe_ingredient_params[:recipe_ingredient])
        if @recipe_ingredient.valid?
            @recipe_ingredient.save
            redirect_to @recipe_ingredient
        else
            flash[:errors] = @recipe_ingredient.errors.messages
            render :edit
        end
    end

    def destroy
        @recipe_ingredient = RecipeIngredient.find(params[:id])
        @recipe_ingredient.destroy
        #redirect to recipe index page
        redirect_to recipes_path
    end

    private

    def recipe_ingredient_params
        params.permit(recipe_ingredient:[:recipe_id, :ingredient_id])
    end
end
