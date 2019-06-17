class PalettesController < ApplicationController

    before_action :find_palette, only: [:show, :edit, :destroy]

    def new
      @palette = Palette.new
    end

    def create
        palette = Palette.create palette_params
        if palette
            redirect_to palette
        else
            flash[:errors] = palette.errors.full_messages
            redirect to new_palette_path
        end
    end

    def show
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
    end

    private

    def palette_params
        params.require(:palette).permit(:user_id, :title, colours_attributes: [])
    end

    def find_palette
        @palette = Palette.find params[:id]
    end

end
