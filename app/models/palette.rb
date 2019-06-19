class Palette < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :colours, dependent: :destroy

  accepts_nested_attributes_for :colours

  def self.top_three_liked
    self.all.sort_by{|palette| palette.likes.count}.reverse.limit(3)
  end

  def self.palette_of_the_day
    palette_arr = []
    palettes = self.all
    len = palettes.size - 1

    3.times do
      palette_arr << palettes[rand(0..len)]
    end

    palette_arr
  end

  def self.recent_palettes
    palette_arr = []
    palettes = Palette.all

    if palletes < 40
      return palettes
    else
      num1 = palettes.length - 40
      num2 = palettes.length
      return palettes[num1..num2]
    end
  end
end
