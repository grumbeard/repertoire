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

# image_url_prefix = Rails.root.join('app', 'assets', 'images')

puts "Creating Story 'BBQ'"
bbq = Story.new(
  title: 'BBQ',
  latitude: 1.280509,
  longitude: 103.846650,
  price_rating: 2,
  worth_it: true,
  mood_type: 'Adventurous',
  feeling_type: 'Satisfied',
  ambience_type: 'Chill'
)
# bbq.photos.attach(io: File.open(image_url_prefix.join('bbq.jpg')), filename: 'bbq.jpg', content_type: 'image/png')
bbq.save

puts "Creating Story 'Noodles'"
noodles = Story.new(
  title: 'Noodles',
  latitude: 1.390509,
  longitude: 114.846650,
  price_rating: 1,
  worth_it: false,
  mood_type: 'Content',
  feeling_type: 'Bloated',
  ambience_type: 'Ordinary'
)
# noodles.photos.attach(io: File.open(image_url_prefix.join('noodles.jpg')), filename: 'noodles.jpg', content_type: 'image/png')
noodles.save

puts "Creating Story 'Pancakes'"
pancakes = Story.new(
  title: 'Pancakes',
  latitude: 1.2828473,
  longitude: 103.8493041,
  price_rating: 2,
  worth_it: false,
  mood_type: 'Exhausted',
  feeling_type: 'Refreshed',
  ambience_type: 'Calming'
)
# pancakes.photos.attach(io: File.open(image_url_prefix.join('pancakes.jpg')), filename: 'pancakes.jpg', content_type: 'image/png')
pancakes.save

puts "Creating Story 'Pumpkin'"
pumpkin = Story.new(
  title: 'Pumpkin',
  latitude: 1.2889762,
  longitude: 103.8468694,
  price_rating: 2,
  worth_it: true,
  mood_type: 'Blissful',
  feeling_type: 'Satisfied',
  ambience_type: 'Classy'
)
# pumpkin.photos.attach(io: File.open(image_url_prefix.join('pumpkin_soup.jpg')), filename: 'pumpkin.jpg', content_type: 'image/png')
pumpkin.save

puts "Creating Story 'Ramen'"
ramen = Story.new(
  title: 'Ramen',
  latitude: 1.2798245,
  longitude: 103.8476457,
  price_rating: 2,
  worth_it: true,
  mood_type: 'Content',
  feeling_type: 'Bloated',
  ambience_type: 'Homely'
)
# ramen.photos.attach(io: File.open(image_url_prefix.join('ramen.jpg')), filename: 'ramen.jpg', content_type: 'image/png')
ramen.save

puts "Creating Story 'Steak'"
steak = Story.new(
  title: 'Steak',
  latitude: 1.2923514,
  longitude: 103.8586837,
  price_rating: 3,
  worth_it: true,
  mood_type: 'Blissful',
  feeling_type: 'Victorious',
  ambience_type: 'Upbeat'
)
# steak.photos.attach(io: File.open(image_url_prefix.join('steak.jpg')), filename: 'steak.jpg', content_type: 'image/png')
steak.save

puts "Creating Tag Category 'Location'"
location = TagCategory.new(name: 'Location')
location.save

puts "Creating Tag Category 'Mood'"
mood = TagCategory.new(name: 'Mood')
mood.save

puts "Creating Tag Category 'Feeling'"
feeling = TagCategory.new(name: 'Feeling')
feeling.save

puts "Creating Tag Category 'Ambience'"
ambience = TagCategory.new(name: 'Ambience')
ambience.save

puts "Creating Tag 'Blissful'"
blissful = Tag.new(name: 'Blissful', tag_category: mood)
blissful.save

puts "Creating Tag 'Refreshed'"
refreshed = Tag.new(name: 'Refreshed', tag_category: feeling)
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

puts "Geocoding Stories..."
Story.all.each do |story|
  address_details = []
  puts "Geocoding #{story.title}"
  results = Geocoder.search([story.latitude, story.longitude])
  if results.present?
    story.address = results.first.address
    address_details << results.first.street if results.first.street
    address_details << results.first.neighbourhood if results.first.neighbourhood
    address_details << results.first.suburb if results.first.suburb
  end

  puts "Tagging Location to Stories..."
  address_details.each do |value|
    puts "Adding Tags with Location: #{value}"
    tag = Tag.new(name: value, tag_category: location) unless Tag.where(name: value).present?
    if tag
      tag.save
      puts "Added tag #{tag.name}"
      sleep(1)
    else
      puts "Failed to add tag #{value}"
    end
    puts "Tagging #{value} to #{story.title}"
    tagging = Tagging.new(story: story, tag: Tag.where(name: value).first)
    if tagging.save
      puts "Tagged #{value}"
    else
      puts "Failed to tag #{value}"
    end
  end
  sleep(1)
end
