class CommentsController < ApplicationController

  before_action :find_palette
  before_action :find_comment
  before_action :current_user, only: [:create]

    def new
        @comment = Comment.new
    end

    def create
      if logged_in?
            comment = @palette.comments.create(user_id: @user.id, comment: comment_params[:comment])
            redirect_to palette_path(comment.palette)
        else
            flash[:notice] = "You must be logged in to make a comment"
            redirect_to palette_path(@palette)
        end
    end

    private

    def comment_params
      params.require(:comment).permit(:palette_id, :user_id, :comment)
    end

    def find_palette
      @palette = Palette.find params[:palette_id]
    end

    def find_comment
      @comment = @palette.comments.find_by(user_id: current_user.id)
    end
end
