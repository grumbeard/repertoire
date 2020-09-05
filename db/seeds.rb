# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
puts "Destroyed all users"

Story.destroy_all
puts "Destroyed all stories"

Tag.destroy_all
puts "Destroyed all tags"

TagCategory.destroy_all
puts "Destroyed all tag categories"

puts "Creating User 'Doodle Bear'"
doodlebear = User.new(
  username: 'doodlebear',
  # email: 'doodlebear@email.com',
  password: 'password',
  first_name: 'Doodle',
  last_name: 'Bear'
)
if doodlebear.save
  puts 'Doodle Bear created'
else
  puts 'Failed to create Doodle Bear'
end

puts "Creating Story 'BBQ'"
bbq = Story.new(
  title: 'BBQ',
  photos: ['../assets/images/seed/bbq'],
  latitude: 1.280509,
  longitude: 103.846650,
  price_rating: 2,
  worth_it: true,
  mood_type: 'Adventurous',
  experience_type: 'Satisfied',
  ambience_type: 'Chill'
)
bbq.save

puts "Creating Story 'Noodles'"
noodles = Story.new(
  title: 'Noodles',
  photos: ['../assets/images/seed/noodles'],
  latitude: 1.290509,
  longitude: 102.846650,
  price_rating: 1,
  worth_it: false,
  mood_type: 'Content',
  experience_type: 'Bloated',
  ambience_type: 'Ordinary'
)
noodles.save

puts "Creating Story 'Pancakes'"
pancakes = Story.new(
  title: 'Pancakes',
  photos: ['../assets/images/seed/pancakes'],
  latitude: 1.300509,
  longitude: 101.846650,
  price_rating: 2,
  worth_it: false,
  mood_type: 'Exhausted',
  experience_type: 'Refreshed',
  ambience_type: 'Calming'
)
pancakes.save

puts "Creating Story 'Pumpkin'"
pumpkin = Story.new(
  title: 'Pumpkin',
  photos: ['../assets/images/seed/pumpkin'],
  latitude: 1.300509,
  longitude: 101.896650,
  price_rating: 2,
  worth_it: true,
  mood_type: 'Blissful',
  experience_type: 'Satisfied',
  ambience_type: 'Classy'
)
pumpkin.save

puts "Creating Story 'Ramen'"
ramen = Story.new(
  title: 'Ramen',
  photos: ['../assets/images/seed/ramen'],
  latitude: 1.200509,
  longitude: 101.046650,
  price_rating: 2,
  worth_it: true,
  mood_type: 'Content',
  experience_type: 'Bloated',
  ambience_type: 'Homely'
)
ramen.save

puts "Creating Story 'Steak'"
steak = Story.new(
  title: 'Steak',
  photos: ['../assets/images/seed/steak'],
  latitude: 1.305509,
  longitude: 101.851650,
  price_rating: 3,
  worth_it: true,
  mood_type: 'Blissful',
  experience_type: 'Victorious',
  ambience_type: 'Upbeat'
)
steak.save

puts "Creating Tag Category 'Mood'"
mood = TagCategory.new(name: 'Mood')
mood.save

puts "Creating Tag Category 'Experience'"
experience = TagCategory.new(name: 'Experience')
experience.save

puts "Creating Tag Category 'Ambience'"
ambience = TagCategory.new(name: 'Ambience')
ambience.save

puts "Creating Tag 'Blissful'"
blissful = Tag.new(name: 'Blissful', tag_category: mood)
blissful.save

puts "Creating Tag 'Refreshed'"
refreshed = Tag.new(name: 'Refreshed', tag_category: experience)
refreshed.save

puts "Creating Tag 'Chill'"
chill = Tag.new(name: 'Chill', tag_category: ambience)
chill.save

puts "Tagging Stories"
Story.all.each do |story|
  puts "Tagging Story #{story.title}"
  Tag.all.each do |tag|
    tagging = Tagging.new(story: story, tag: tag)
    if tagging.save
      puts "Tagged #{tag.name}"
    else
      "Failed to tag #{tag.name}"
    end
  end
end
