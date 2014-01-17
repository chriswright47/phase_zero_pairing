class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.timestamps
    end
  end
end
