class User < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :palettes, dependent: :destroy

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :first_name, presence: true, format: { with: /\A[a-zA-Z'-]*\z/}
    validates :last_name, presence: true, format: { with: /\A[a-zA-Z'-]*\z/}

    validates :first_name, length: {minimum: 2}
    validates :first_name, length: {maximum: 22}
    validates :last_name, length: {minimum: 2}
    validates :last_name, length: {maximum: 22}
    validates :username, length: {minimum: 2}
    validates :username, length: {maximum: 22}
    validates :bio, length: {maximum: 200}

    
    has_secure_password

    def liked_palettes
        self.likes.each {|like| like.palette}
    end

end
