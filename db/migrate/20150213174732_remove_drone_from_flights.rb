class RemoveDroneFromFlights < ActiveRecord::Migration
  def change
    remove_column :flights, :drone, :string
  end
end
