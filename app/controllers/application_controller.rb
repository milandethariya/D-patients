class ApplicationController < ActionController::Base
	#before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name,:medical_speciality, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :medical_speciality, :email, :password, :current_password)}
    end
    
    def after_sign_in_path_for(resource)
      puts "name : #{resource.inspect}"
      if resource.class == Doctor
        puts current_doctor.inspect
        puts "id: #{current_doctor.id}"
        doctor_path(current_doctor)
      elsif resource.class == Patient
        puts current_patient.inspect
        puts "id: #{current_patient.id}"
        patients_show_path(current_patient)
      else
        #super
        admin_dashboard_path
      end
    end



end
