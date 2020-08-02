# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
puts "Destroyed all users"

puts "Creating User 'Doodle Bear'"
doodlebear = User.new(
  email: 'doodlebear@re-per-toire.com',
  password: 'password',
  first_name: 'Doodle',
  last_name: 'Bear'
)
doodlebear.save
