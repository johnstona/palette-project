class Palette < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :colours, dependent: :destroy

  accepts_nested_attributes_for :colours

  validates :colours, presence: :true

  def self.top_three_liked
    self.all.sort_by{|palette| palette.likes.count}.reverse.limit(3)
  end


end
