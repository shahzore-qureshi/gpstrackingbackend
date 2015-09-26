class ModifyColumn < ActiveRecord::Migration
  def change
    change_column :gps_trackers, :imei, :float
    change_column_null :gps_trackers, :imei, false
    change_column_null :gps_trackers, :mac, false
  end
end
