class Palette < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :colours

  accepts_nested_attributes_for :colours

  def self.top_three_liked
    self.all.sort_by{|palette| palette.likes.count}.reverse.limit(3)
  end


end
