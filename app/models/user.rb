class User < ApplicationRecord
    has_many :cook_books
    has_many :recipes, through: :cook_books

    validates :name, :password, presence: true
    validates :name, uniqueness: true
end
  