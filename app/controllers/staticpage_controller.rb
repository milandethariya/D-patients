class StaticpageController < ApplicationController
	def new
	end

	def hello
		puts current_doctor.inspect
	end

	def bye
		puts current_patient.inspect
	end
end
