class AddUserIdForeignKeyToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :teacher_id, :integer
  end
end
