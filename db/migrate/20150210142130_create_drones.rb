class CreateDrones < ActiveRecord::Migration
  def change
    create_table :drones do |t|
      t.string :model
      t.string :make
      t.integer :flight_id

      t.timestamps
    end
  end
end
