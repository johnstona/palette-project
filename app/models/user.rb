class User < ApplicationRecord
    has_many :likes
    has_many :comments
    has_many :palettes

    validates :username, presence: true
    validates :username, uniqueness: true
    # has_secure_password

end
