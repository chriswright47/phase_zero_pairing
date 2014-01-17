class AddCompleteToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :complete, :boolean
  end
end
