class AddLatitudeToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :latitude, :float
  end
end
