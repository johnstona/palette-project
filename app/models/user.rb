class User < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :palettes, dependent: :destroy

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :first_name, presence: true, format: { with: /\A[a-zA-Z'-]*\z/}
    validates :last_name, presence: true, format: { with: /\A[a-zA-Z'-]*\z/}
    validates :password, presence: true

    validates :first_name, length: {minimum: 2}
    validates :first_name, length: {maximum: 22}
    validates :last_name, length: {minimum: 2}
    validates :last_name, length: {maximum: 22}
    validates :username, length: {minimum: 2}
    validates :username, length: {maximum: 22}
    validates :password, length: {minimum: 2}
    validates :password, length: {maximum: 16}
    validates :bio, length: {minimum: 15}
    validates :bio, length: {maximum: 200}

    
    has_secure_password

end
