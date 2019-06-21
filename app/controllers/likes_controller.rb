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

          if params[:redirect] == 'palette'
            redirect_to palette_path(like.palette)
          elsif params[:redirect] == 'main'
            redirect_to palettes_path
          elsif params[:redirect] == 'user'
            redirect_to user_path(params[:user_id])
          end

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

        if params[:redirect] == 'palette'
          redirect_to palette_path(@palette)
        elsif params[:redirect] == 'main'
          redirect_to palettes_path
        elsif params[:redirect] == 'user'
          redirect_to user_path(params[:user_id])
        end
    end

    private

    def like_params
        params.require(:like).permit(:palette_id, :user_id, :redirect)
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
