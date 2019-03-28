class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.all
    end

    def show
        @ingredient = Ingredient.find(params[:id])
    end

    def new
        @errors = flash[:errors] || {}
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params[:ingredient])
        if @ingredient.valid?
            @ingredient.save 
            redirect_to @ingredient
        else
            flash[:errors] = @ingredient.errors.messages
            render :new
        end
    end

    def edit
        @ingredient = Ingredient.find(params[:id])
        @ingredients = Ingredient.all
        @errors = flash[:errors] || {}
    end

    def update
        @ingredient = Ingredient.find(params[:id])
        @ingredient.assign_attributes(ingredient_params[:ingredient])
        if @ingredient.valid?
            @ingredient.save
            redirect_to @ingredient
        else
            flash[:errors] = @ingredient.errors.messages
            render :edit
        end
    end

    def destroy
        @ingredient = Ingredient.find(params[:id])
        @ingredient.destroy
        #redirect to ingredients index page
        redirect_to ingredients_path
    end

    private

    def ingredient_params
        params.permit(ingredient:[:name, :description, :origin_country, :recipe_list, :recipe, {recipe_ids:[]}, :recipe_ids])
    end
end
