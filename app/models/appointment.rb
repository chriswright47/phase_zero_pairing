class Appointment < ActiveRecord::Base
  has_many :user_appointments
  has_many :users, through: :user_appointments

  def present_to_user
    'need to implement this method which converts Date and Time to strings for user'
    # something along lines of self.time ... + self.date ...
  end
end
