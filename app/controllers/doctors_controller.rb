class DoctorsController < ApplicationController
	before_action :authenticate_doctor!
	before_action :set_doctor, only:[:show]

	def show

	end

	private

	def set_doctor
		@doctor = Doctor.find(current_doctor.id)
	end
end
