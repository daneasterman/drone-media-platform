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

d1 = Drone.create!(model: "Phantom 1", make: "DJI")
d2 = Drone.create!(model: "IRIS+", make: "3DR")
d2 = Drone.create!(model: "X8+", make: "3DR")
d3 = Drone.create!(model: "Phantom 2", make: "DJI" )
d4 = Drone.create!(model: "Phantom 2 Vision", make: "DJI")
d5 = Drone.create!(model: "Inspire 1", make: "DJI" )
d6 = Drone.create!(model: "AR.Drone", make: "Parrot")
d7 = Drone.create!(model: "BeBop", make: "Parrot")

c1 = Camera.create!(model: "Hero 1", make: "GoPro")
c2 = Camera.create!(model: "Hero 2", make: "GoPro")
c3 = Camera.create!(model: "Hero 3 Black Edition", make: "GoPro")
c4 = Camera.create!(model: "Hero 3 Silver Edition", make: "GoPro")
c5 = Camera.create!(model: "Hero 4", make: "GoPro")
c6 = Camera.create!(model: "5D", make: "Canon")

# Normal users

5.times do
  user = User.create!(first_name: "#{Faker::Name.first_name}", last_name: "#{Faker::Name.last_name}", email: "#{Faker::Internet.email}", password: "password", user_image: "#{Faker::Avatar.image}")

# FLIGHTS:

  user.flights.create!(location: "Shoreditch, London N1, UK", video_link: "https://www.youtube.com/watch?v=cfoLYTKObiU", longitude: -0.084728000000041, latitude: 51.52849, drone_id: d1.id)

  user.flights.create!(location: "Cape Town, Western Cape, South Africa", video_link: "https://www.youtube.com/watch?v=Eh_524coBzA", longitude: 18.4240553, latitude: -33.9248685, drone_id: d2.id )

  user.flights.create!(location: "Shoreditch, London N1, UK", video_link: "https://www.youtube.com/watch?v=cfoLYTKObiU", longitude: "-0.084728000000041", latitude: "51.52849", drone_id: d3.id)

  user.flights.create!(location: "Shoreditch, London N1, UK", video_link: "https://www.youtube.com/watch?v=cfoLYTKObiU", longitude: "-0.084728000000041", latitude: "51.52849", drone_id: d5.id)

end





