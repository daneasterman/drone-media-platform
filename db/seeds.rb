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

daniel = User.create!(first_name: "Daniel", last_name: "Easterman", email: "daniel.easterman@gmail.com", password: "password", role: :admin)

sadiq = User.create!(first_name: "Sadiq", last_name: "Okocha", email: "sadiq.okocha@gmail.com", password: "password", role: :normal)

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

# user = User.create!(first_name: "#{Faker::Name.first_name}", last_name: "#{Faker::Name.last_name}", email: "#{Faker::Internet.email}", password: "password", user_image: "#{Faker::Avatar.image}", role: :normal)

# FLIGHTS:

  daniel.flights.create!(formatted_address: "Lisbon, Portugal", video_link: "https://www.youtube.com/watch?v=AA_H3tnaaco", lng: -9.13933659999998, lat: 38.7222524, drone_id: d1.id, camera_id: c3.id)

  daniel.flights.create!(formatted_address: "Cape Town, Western Cape, South Africa", video_link: "https://www.youtube.com/watch?v=Eh_524coBzA", lng: 18.4240553, lat: -33.9248685, drone_id: d2.id, camera_id: c2.id) 
  
  daniel.flights.create!(formatted_address: "Shoreditch, London N1, UK", video_link: "https://www.youtube.com/watch?v=cfoLYTKObiU", lng: "-0.084728000000041", lat: "51.52849", drone_id: d6.id, camera_id: c1.id)

  daniel.flights.create!(formatted_address: "Rio de Janeiro - State of Rio de Janeiro, Brazil", video_link: "https://www.youtube.com/watch?v=mxBM-JLNyBg", lng: -43.1728965, lat: -22.9068467, drone_id: d3.id, camera_id: c5.id)

  sadiq.flights.create!(formatted_address: "San Francisco, CA, United States", video_link: "https://www.youtube.com/watch?v=dQwBvSYFeJU", lng: "-122.4194155", lat: "37.7749295", drone_id: d5.id, camera_id: c3.id, remote_flight_image_url: "http://i.imgur.com/uW2fzRa.jpg")

  daniel.flights.create!(formatted_address: "Palo Alto Caltrain Station, Palo Alto, CA, United States" video_link: "https://www.youtube.com/watch?v=wmIvSvmmfuQ", lng: -122.1649, lat: 37.44307, drone_id: d4.id, camera_id: c1.id, remote_flight_image_url: "http://i.imgur.com/SSbV8o4.jpg")  

  sadiq.flights.create!(formatted_address: "New York, NY, United States", video_link: "https://www.youtube.com/watch?v=qz6c7IrmznI", lng: "-74.0059413", lat: "40.7127837", drone_id: d1.id, camera_id: c4.id)