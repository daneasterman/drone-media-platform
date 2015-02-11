class RemoveFlightIdFromCameras < ActiveRecord::Migration
  def change
    remove_column :cameras, :flight_id, :integer
  end
end
