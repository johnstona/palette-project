class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :palette

  validates :comment, presence: true 
end
