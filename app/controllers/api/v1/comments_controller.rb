module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :authenticate_user!, only: [:create]

      def index
        @post = Post.find(params[:post_id])
        @comments = @post.comments
        render json: @comments
      end

      def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        @comment.user = current_user

        if @comment.save
          render json: @comment, status: :created
        else
          render json: { success: false, errors: @comment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
