class AddCameraIdToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :camera_id, :integer
  end
end
