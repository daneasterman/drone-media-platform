class AddFlightImageToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :flight_image, :string
  end
end
