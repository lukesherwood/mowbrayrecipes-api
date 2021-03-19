class CommentsController < ApplicationController

    def index
        @recipe = Recipe.find(params[:recipe_id])
        @comments = @recipe.comments
        options = { include: [:user.name], fields: { user: [:name] } }
        render json: CommentSerializer.new(@recipes, options).serializable_hash.to_json
      end

      def create
        @recipe = Recipe.find(params[:recipe_id])
        comment = Comment.new(comment_params)
        if comment.save
          render json: CommentSerializer.new(comment).serializable_hash.to_json
        else
          render json: comment.errors, status: :unprocessable_entity
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:content, :rating, :user_id, :recipe_id)
      end

end
