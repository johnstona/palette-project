class LikesController < ApplicationController

    before_action :find_palette
    before_action :find_like, only: [:destroy]
    before_action :current_user, only: [:create, :destroy]

    def new
        @like = Like.new
    end

    def create
        if already_liked?
            flash[:errors] = ["You have already liked this palette"]
        elsif logged_in?
            like = @palette.likes.create(user_id: @user.id)
            redirect_to palette_path(like.palette)
        else
            flash[:errors] = ["You must be logged in to like this palette"]
            redirect_to palette_path(@palette)
        end
    end

    def destroy
        if !already_liked?
            flash[:errors] = ["You can't unlike a palette you haven't liked"]
        else
            @like.destroy
        end
        redirect_to palette_path(@palette)
    end

    private

    def like_params
        params.require(:like).permit(:palette_id, :user_id)
    end

    def already_liked?
        Like.where(user_id: current_user.id, palette_id: params[:palette_id]).exists?
    end

    def find_palette
        @palette = Palette.find params[:palette_id]
    end

    def find_like
        @like = @palette.likes.find_by(user_id: current_user.id)
    end
    
end
