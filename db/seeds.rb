require_relative '../config/environment'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.destroy_all
 
user = User.new({ :username => "Adam Moran",  :password => "cookie", :translator => false })
user.hash_password # calling the method in user model
user.save