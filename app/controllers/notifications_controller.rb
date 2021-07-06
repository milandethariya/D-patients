class NotificationsController < ApplicationController
	before_action :authenticate_doctor!, only:[:doctor_notification]
	before_action :authenticate_patient!, only:[:patient_notification]

	def doctor_notification
		doctor = Doctor.find_by(id: params[:id])
		@notifications =  doctor.notifications
	end

	def patient_notification
		patient = Patient.find_by(id: params[:id])
		@notifications =  patient.notifications
	end
end
