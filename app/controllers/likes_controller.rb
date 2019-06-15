class LikesController < ApplicationController

    def new
        @like = Like.new
    end

    def create
        if logged_in?
            like = Like.create like_params
            redirect_to palette_path(like.palette)
        else
            flash[:errors] = like.errors.full_messages
            redirect_to :login
        end
    end

    def like_params
        params.require(:like).permit(:palette_id, :user_id)
    end
    
end
