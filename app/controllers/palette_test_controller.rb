class PaletteTestController < ApplicationController

  before_action :find_palette, only: [:thingy]

  def thingy

    @bgcolour = []
  end

  private

  def find_palette
      @palette = Palette.find params[:id]
  end

end
