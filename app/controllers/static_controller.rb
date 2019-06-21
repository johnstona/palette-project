class StaticController < ApplicationController

  before_action :find_palette, only: [:palette_test]
  def show
    render "/about"
    render "/terms"
    render "/cookies"
    render "/mit"
  end

  def palette_test
    # @paletteTest = Palette.find_by params[:id]
    @bgcolour = []
  end

  private

  def find_palette
      @palette = Palette.find params[:id]
  end
end
