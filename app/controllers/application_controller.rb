class ApplicationController < ActionController::Base
	 before_action :configure_permitted_parameters, if: :devise_controller?

   protected
    def configure_permitted_parameters
         devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name,:medical_speciality, :email, :password)}

         devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :medical_speciality, :email, :password, :current_password)}
    end

    def after_sign_in_path_for(resource)
		  if resource.class == Doctor
		  	puts "hello"
      	staticpage_hello_path
    	elsif resource.class == Patient
    		puts "bye"
      	staticpage_bye_path
			end
		end
end
