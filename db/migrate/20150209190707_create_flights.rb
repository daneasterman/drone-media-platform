class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :location
      t.string :video_link
      t.string :camera
      t.string :drone
      t.integer :user_id

      t.timestamps
    end
  end
end
