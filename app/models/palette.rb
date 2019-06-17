class Palette < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :colours

  accepts_nested_attributes_for :colours
end
