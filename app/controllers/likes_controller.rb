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

    private

    def like_params
        params.require(:like).permit(:palette_id, :user_id)
    end

    def already_liked?
        Like.where(user_id: current_user.id, palette_id: params[:palette_id]).exists?
    end
    
end
