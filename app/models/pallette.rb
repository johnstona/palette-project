class Pallette < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :colours
end
