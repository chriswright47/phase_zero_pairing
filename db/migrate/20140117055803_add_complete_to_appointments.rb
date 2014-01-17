class AddCompleteToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :complete, :boolean, default: false
  end
end
