class User < ActiveRecord::Base
  has_secure_password

  has_many :user_appointments
  has_many :appointments, through: :user_appointments
end
