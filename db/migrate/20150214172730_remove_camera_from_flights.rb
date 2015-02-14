class RemoveCameraFromFlights < ActiveRecord::Migration
  def change
    remove_column :flights, :camera, :string
  end
end
