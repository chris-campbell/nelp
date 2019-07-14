# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(
    email: 'christopher.campbell@outlook.com',
    password: '123fake',
    password_confirmation: '123fake'
  )

10.times do |n|

  Place.create!( name: "Yet another cool Place to checkout #{n}",
                 description: "Lorem ipsum dolor sit amet, consectetur
                               adipiscing elit. Curabitur sit amet dolor orci.",
                 address: "389 E 37th Street, Brooklyn, NY",
                 user_id: user.id,
                 latitude: 40.7843627,
                 longitude: -73.9778376,
                 range: 3
    )
    place = Place.last
    place.picture.store!(File.open(File.join(Rails.root, 'app/assets/images/space.png')))
    Tally.create!(place_id: place.id)
end
