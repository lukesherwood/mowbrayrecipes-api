class Api::V1::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.sort { |a, b| a.updated_at <=> b.updated_at }
    options = { include: [:user.name], fields: { user: [:name] } }
    render json: RecipeSerializer.new(@recipes, options).serializable_hash.to_json
  end

  def userRecipes
    @user = set_user()
    @recipes = Recipe.where(user_id: @user.id).sort { |a, b| a.updated_at <=> b.updated_at }
    render json: RecipeSerializer.new(@recipes).serializable_hash.to_json
  end

  def show
    @recipe = Recipe.find(params[:id])
    if @recipe
      render json: RecipeSerializer.new(@recipe, include: [:user]).serializable_hash.to_json
    else
      render json: { message: 'Recipe not found' }
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      render json: RecipeSerializer.new(@recipe, params: { recipe: @recipe }).serializable_hash.to_json
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def update
    @recipe = Recipe.find(recipe_params[:id])
    if @recipe.update(recipe_params)
      render json: RecipeSerializer.new(@recipe, params: { context: self }).serializable_hash.to_json
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(recipe_params[:id])
    if @recipe.destroy
      render json: {}, status: :accepted
    else
      render json: { message: 'Error deleting recipe' }
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:user_id, :name, :ingredients, :id, :method, :serves, :image_url, :course,
                                   :cuisine, :prep_time, :cook_time, :description, :image)
  end
end
