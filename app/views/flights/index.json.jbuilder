json.array!(@flights) do |flight|
  json.extract! flight, :id, :location, :video_link, :camera, :drone, :user_id
  json.url flight_url(flight, format: :json)
end
