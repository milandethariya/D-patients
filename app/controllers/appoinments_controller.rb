class AppoinmentsController < ApplicationController

  def new
    @doctor = Doctor.find(params[:doctor_id])
    @appoinment = Appoinment.new
  end

  def create
    @appoinment = current_patient.appoinments.build(set_params)
    @appoinment.start_time = params[:appoinment][:start_time].to_datetime
    doctor_appoinment = Doctortimeslot.find_by(doctor_id: params[:appoinment][:doctor_id], appoinment_date: params[:appoinment][:appoinment_date])
    @appoinment.end_time = (@appoinment.start_time + doctor_appoinment.time_slot * 60).to_time
    @doctor = Doctor.find(params[:appoinment][:doctor_id])
    if @appoinment.save
      flash[:notice] = "succesfully sent appoinment to  #{@doctor.name}"
      @doctor.notifications << Notification.new(content: "#{current_patient.name} apply for appoinment as appoinmentdate #{params[:appoinment][:appoinment_date]} at #{@appoinment.start_time.strftime("%H:%M")} to  #{ @appoinment.end_time.strftime("%H:%M")} ")
      redirect_to appoinments_patient_appoinment_path
    else
      flash.now[:notice] = "Appoinment is not set"
      render 'appoinments/new'
      #redirect_to doctors_index_path
    end
  end

  def patient_appoinment
    @appoinments = current_patient.appoinments.where(is_approve: true)
  end

  def doctor_appoinment
    @appoinments = current_doctor.appoinments.where(is_approve: true)
  end

  def doctor_appoinment_application_list
    @appoinments = current_doctor.appoinments
  end

  def update
    @appoinment = current_doctor.appoinments.find(params[:id])
    patient = @appoinment.patient
    if params[:type] == "approve"
      flash[:notice] = "appoinment is approve"
      @appoinment.update(is_approve: true, is_reject: false)
      patient.notifications << Notification.new(content: "your appoinment as appoinment date #{@appoinment.appoinment_date} at #{@appoinment.start_time.strftime("%H:%M")} to #{@appoinment.end_time.strftime("%H:%M")} is Rejected by #{@appoinment.doctor.name} ")
    elsif params[:type] == "reject"
      flash[:notice] = "appoinment is rejected"
      @appoinment.update(is_reject: true, is_approve: false)
      patient.notifications << Notification.new(content: "your appoinment as appoinment date #{@appoinment.appoinment_date} at #{@appoinment.start_time.strftime("%H:%M")} to #{@appoinment.end_time.strftime("%H:%M")} is Rejected by #{@appoinment.doctor.name} ")
    end
    redirect_to appoinments_doctor_appoinment_application_list_path
  end

  def slot_show
    @appoinmenttimeslot = Doctortimeslot.find_by(doctor_id: params[:id], appoinment_date: params[:select_date])
    appoinments = Appoinment.where(doctor_id: params[:id], appoinment_date: params[:select_date]).pluck(:start_time.to_s)
    if @appoinmenttimeslot.present?
      @doctor = Doctor.find(params[:id])
      @date = params[:select_date]
      slot_time = @appoinmenttimeslot.time_slot
      start_time = @appoinmenttimeslot.start_time
      end_time = @appoinmenttimeslot.end_time
      @slot = []
      while(start_time < end_time) do
        unless appoinments.include?(start_time)
          @slot.push("#{start_time}+#{slot_time*60}")
        end
        start_time = start_time + slot_time*60
      end
    end
    @appoinment = Appoinment.new
  end

  private

    def set_params
      params.require(:appoinment).permit(:doctor_id, :appoinment_date, :start_time)
    end
end
