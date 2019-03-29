class PagesController < ApplicationController
    def search
        if params[:search].blank?
            redirect_to(root_path, alert: "Empty field!") and return
        else
            @parameter = params[:search].downcase
            @rec_results = Recipe.all.where("lower(name) LIKE :search", search:"%#{@parameter}%" )
            @ing_results = Ingredient.all.where("lower(name) LIKE :search", search:"%#{@parameter}%" )
            # @results = Recipe.joins(:ingredient).search(params[:search]).order("recipes.name DESC")
        end
    end
end