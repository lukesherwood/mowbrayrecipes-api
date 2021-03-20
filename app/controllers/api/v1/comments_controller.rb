class Api::V1::CommentsController < ApplicationController

    def index
        @recipe = Recipe.find(params[:recipe_id])
        @comments = @recipe.comments
        options = { include: [:user.name], fields: { user: [:name] } }
        render json: CommentSerializer.new(@recipes, options).serializable_hash.to_json
      end

      def create
        @recipe = Recipe.find(params[:recipe_id])
        @user = User.find_by(id: comment_params[:user_id])
        comment = @recipe.comments.build(comment_params)
        comment.name = @user.name
        # options = { include: [:comments], fields: { comments: {user: [:name]} } }
        if comment.save
          render json: RecipeSerializer.new(@recipe).serializable_hash.to_json
        else
          render json: comment.errors, status: :unprocessable_entity
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:content, :rating, :user_id, :recipe_id, :name)
      end

end
