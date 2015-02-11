class RemoveFlightIdFromDrones < ActiveRecord::Migration
  def change
    remove_column :drones, :flight_id, :integer
  end
end
