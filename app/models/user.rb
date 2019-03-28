
class User < ApplicationRecord    
    has_many :cook_books 
    has_many :recipes, through: :cook_books

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, confirmation: true

    attr_accessor :password
    has_secure_password
    

    def authenticate(password)
        if BCrypt::Password.new(self.password_digest) == password
            true
        else
            false
        end
    end

   def hash_password
     if password.present?
        return self.password_digest = BCrypt::Password.create(password)
     end
   end

  
    # def self.my_import(file)
    #     users = []
    #     CSV.foreach(file, :headers => true) do |row|
    #         User.create!(row.to_hash)
    #     end
    #     User.import users, recursive: true
    # end
      
end
    