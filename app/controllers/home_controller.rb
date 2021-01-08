class HomeController < ApplicationController

    def welcome
        @recipes = Recipe.all
        render json: RecipeSerializer.new(@recipes).serializable_hash.to_json
    end
    
end