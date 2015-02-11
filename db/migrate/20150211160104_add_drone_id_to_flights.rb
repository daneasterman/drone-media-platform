class AddDroneIdToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :drone_id, :integer
  end
end
