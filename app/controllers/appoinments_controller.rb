class AppoinmentsController < ApplicationController

	def new
		@doctor = Doctor.find(params[:doctor_id])
		@appoinment = Appoinment.new
	end

	def create
		@appoinment = current_patient.appoinments.build(set_params)
		@doctor = Doctor.find(params[:appoinment][:doctor_id])
		if @appoinment.save
			flash.now[:notice] = "succesfully sent appoinment to  #{@doctor.name}"
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
		if params[:type] == "approve"
			flash[:notice] = "appoinment is approve"
			@appoinment.update(is_approve: true, is_reject: false)
		elsif params[:type] == "reject"
			flash[:notice] = "appoinment is rejected"
			@appoinment.update(is_reject: true, is_approve: false)
		end
		redirect_to appoinments_doctor_appoinment_application_list_path
	end

	private

		def set_params
			params.require(:appoinment).permit(:doctor_id, :appoinment_date, :start_time, :end_time)
		end
end
