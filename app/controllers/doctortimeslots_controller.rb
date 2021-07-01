class DoctortimeslotsController < ApplicationController

	def create
		@settimeslot = current_doctor.doctortimeslots.build(set_params)
		last_appoinment_start_time = Doctortimeslot.find_by(doctor_id: current_doctor.id).end_time if Doctortimeslot.find_by(doctor_id: current_doctor.id).present?
		if last_appoinment_start_time.present?
			start_time = (last_appoinment_start_time.hour * 60) + last_appoinment_start_time.min 
		else
			start_time = 0
		end
		end_time = (params[:doctortimeslot]["start_time(4i)"].to_i * 60) + params[:doctortimeslot]["start_time(5i)"].to_i
		if start_time < end_time
			if @settimeslot.save
				flash[:notice] = "Successfully set appoinment time at #{params[:doctortimeslot][:appoinment_date].to_date.strftime '%d/%m/%y'}" 
				redirect_to request.referrer
			else
				flash[:notice] = "not set appoinment time at #{params[:doctortimeslot][:appoinment_date].to_date.strftime '%d/%m/%y'}"	
				redirect_to request.referrer	
			end
		else
			flash[:notice] = "set proper appoinment time at #{params[:doctortimeslot][:appoinment_date].to_date.strftime '%d/%m/%y'}"	
			redirect_to request.referrer
		end		
	end

	private

		def set_params
			params.require(:doctortimeslot).permit(:start_time, :end_time, :appoinment_date, :time_slot)
		end
end
