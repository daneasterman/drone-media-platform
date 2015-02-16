# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# USERS:

User.delete_all
Flight.delete_all
Drone.delete_all
Camera.delete_all

# Admin Super User:

daniel = User.create!(first_name: "Daniel", last_name: "Easterman", email: "daniel.easterman@gmail.com", password: "password")

d1 = Drone.create!(model: "Phantom", make: "DJI")
d2 = Drone.create!(model: "Iris", make: "3DR")


# Normal users

5.times do
  user = User.create!(first_name: "#{Faker::Name.first_name}", last_name: "#{Faker::Name.last_name}", email: "#{Faker::Internet.email}", password: "password", user_image: "#{Faker::Avatar.image}")

# FLIGHTS:

  user.flights.create!(formatted_address: "Shoreditch, London N1, UK", video_link: "https://www.youtube.com/watch?v=cfoLYTKObiU", lng: -0.084728000000041, lat: 51.52849, drone_id: d1.id)

  user.flights.create!(formatted_address: "Cape Town, Western Cape, South Africa", video_link: "https://www.youtube.com/watch?v=Eh_524coBzA", lng: 18.4240553, lat: -33.9248685, drone_id: d2.id )

  user.flights.create!(formatted_address: "Shoreditch, London N1, UK", video_link: "https://www.youtube.com/watch?v=cfoLYTKObiU", lng: "-0.084728000000041", lat: "51.52849", drone_id: d1.id)

  user.flights.create!(formatted_address: "Shoreditch, London N1, UK", video_link: "https://www.youtube.com/watch?v=cfoLYTKObiU", lng: "-0.084728000000041", lat: "51.52849", drone_id: d2.id)

end




# CAMERAS:

