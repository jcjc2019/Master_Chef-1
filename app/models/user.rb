require 'csv'
class User < ApplicationRecord
    has_many :cook_books
    has_many :recipes, through: :cook_books

    validates :username, :password_digest, presence: true
    validates :username, uniqueness: true

    def self.import(file)
        CSV.foreach(file, :headers => true) do |row|
            User.create!(row.to_hash)
        end
    end    
end
    