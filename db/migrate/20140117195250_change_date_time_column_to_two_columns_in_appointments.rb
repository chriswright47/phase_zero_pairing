class ChangeDateTimeColumnToTwoColumnsInAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :start_time
    add_column :appointments, :date, :date
    add_column :appointments, :start_time, :time
  end
end
