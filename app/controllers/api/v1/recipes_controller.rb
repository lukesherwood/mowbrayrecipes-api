class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
        render json: @recipes
    end

    def show
        @recipes = Recipe.find(params[:id])
        if @recipe
            render json: @recipe
        else   
            render json: {message: 'Recipe not found'}
        end
    end
end
