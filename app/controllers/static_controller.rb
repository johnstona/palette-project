class StaticController < ApplicationController
  def show
    render "/about"
    render "/terms"
    render "/cookies"
    render "/mit"
  end
end
