class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        if logged_in?
            comment = Comment.create comment_params
            redirect_to palette_path(comment.palette)
        else
            flash[:errors] = comment.errors.full_messages
            redirect_to :login
        end
    end

    def like_params
        params.require(:comment).permit(:palette_id, :user_id)
    end
    
end
