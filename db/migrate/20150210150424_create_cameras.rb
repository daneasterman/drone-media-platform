class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :model
      t.string :make
      t.integer :flight_id

      t.timestamps
    end
  end
end
