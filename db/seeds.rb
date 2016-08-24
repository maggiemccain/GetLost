# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  #  movies = Movie.create({ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

# Event.destroy_all
# Hobby.destroy_all
# rake db:seed
h1 = Hobby.create(sport: 'swimming')
h2 = Hobby.create(sport: 'hiking')

Event.create(listing: 'get lost fun', hobby_id: h2.id)
