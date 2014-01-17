class Appointment < ActiveRecord::Base
  has_many :user_appointments
  has_many :users, through: :user_appointments
  belongs_to :teacher, class_name: 'User'

  def present_to_user
    "#{self.date.strftime("%A %b %-d, %Y")} at #{self.start_time.strftime("%I:%M%p")}"
  end

  def students
    users.where(:teacher => false)
  end

end
