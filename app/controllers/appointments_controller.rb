class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.where(complete: false)
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new()
  end

  def create
    appointment = Appointment.new(appointment_params)
    appointment.teacher = current_user
    appointment.users << current_user
    if appointment.save
      flash[:success] = 'Pairing session successfully created'
      redirect_to appointment_path(appointment)
    else
      flash[:alert] = appointment.errors.full_messages
      redirect_to new_appointment_path
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    appointment = Appointment.find(params[:id])
    if request.xhr?
      if current_user.teacher
        appointment.complete = true
        appointment.save
        render partial: 'complete'
      else
        appointment.users << current_user
        render partial: 'student', locals: {student: current_user}
      end
    else
      appointment.update(appointment_params)
      redirect_to appointment_path(appointment)
    end
  end

  def destroy
    Appointment.find(params[:id]).destroy
    flash[:alert] = 'Pairing session deleted'
    redirect_to home_path
  end

  private
  def appointment_params
    params.require(:appointment).permit(:start_time, :date, :completed)
  end
end