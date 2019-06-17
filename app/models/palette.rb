class Palette < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :colours

  def self.top_three_liked
    self.all.sort_by{|palette| palette.likes.count}.reverse.limit(3)
  end

end
