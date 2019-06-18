class PalettesController < ApplicationController

    before_action :find_palette, only: [:show, :edit, :destroy]
    before_action :current_user
    before_action :liked_by_user?, only: [:show]

    def new
      @palette = Palette.new
    #   nums = params[:num].to_i
    #   nums.times do |num|
        @palette.colours.build(hex_code: "#fff")
        @palette.colours.build(hex_code: "#fff")
        @palette.colours.build(hex_code: "#fff")
        @palette.colours.build(hex_code: "#fff")
    #   end
    end

    def create
      palette = Palette.create palette_params
      if palette
          redirect_to palette_path(palette)
      else
          flash[:errors] = palette.errors.full_messages
          redirect to new_palette_path
      end
    end

    def show
      @colours = Colour.all
      @comments = Comment.all
    end

    def edit
    end

    def update
        palette = palette.update palette_params
        if palette
            redirect_to palette
        else
            flash[:errors] = palette.errors.full_messages
            render :edit
        end
    end

    def destroy
        @palette.destroy
    end

    def index
      @palettes = Palette.all
    end

    private

    def palette_params
        params.require(:palette).permit(:user_id, :title, colours_attributes: [:hex_code])
    end

    def find_palette
        @palette = Palette.find params[:id]
    end

    def liked_by_user?
        @palette.likes.where(user_id: current_user.id)
    end

end
