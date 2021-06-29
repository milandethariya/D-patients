class PatientsController < ApplicationController
	before_action :authenticate_patient!
	before_action :set_patient, only:[:show]

	def show
		
	end

	private

	def set_patient
		@patient = Patient.find(current_patient.id)
	end
end
