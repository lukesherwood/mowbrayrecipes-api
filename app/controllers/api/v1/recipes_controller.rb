class Api::V1::RecipesController < ApplicationController

    def index
        token = request.headers['Authorization'].split(" ").last
        payload = JWT.decode(token, ENV['DEVISE_JWT_SECRET_KEY'], true, algorithm: 'HS256')
        jti = payload.first['jti']
        @user = User.find_by(jti: jti )
        @recipes = Recipe.where(user_id: @user.id)
        render json: @recipes.as_json
    end

    def show
        @recipes = Recipe.find(params[:id])
        if @recipe
            render json: @recipe.to_json
        else   
            render json: {message: 'Recipe not found'}
        end
    end

    def create
        recipe = Recipe.new(recipe_params)
        if recipe.save
            render json: recipe.as_json, status: :created
          else
            render json: recipe.errors, status: :unprocessable_entity
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:user_id, :name, :ingredients, :id, :method, :notes, :image_url)
    end
end
