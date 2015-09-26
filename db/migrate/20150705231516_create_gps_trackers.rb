class CreateGpsTrackers < ActiveRecord::Migration
  def change
    create_table :gps_trackers do |t|
      t.integer :imei
      t.string :mac
      t.float :lat
      t.float :long

      t.timestamps null: false
    end
  end
end
