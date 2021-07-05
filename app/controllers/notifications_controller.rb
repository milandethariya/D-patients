class NotificationsController < ApplicationController
	def doctor_notification
		doctor = Doctor.find_by(id: params[:id])
		@notifications =  doctor.notifications
	end

	def patient_notification
		patient = Patient.find_by(id: params[:id])
		@notifications =  patient.notifications
	end
end
