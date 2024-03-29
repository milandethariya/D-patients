# frozen_string_literal: true

class Doctors::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    doctor = Doctor.find_by(email: params[:doctor][:email])
    if doctor != nil
      if doctor.is_approve == true
        super
      else
        flash[:notice] = "#{doctor.name} is not approve by Admin"
        redirect_to new_doctor_session_path
      end
    else
      flash[:notice] = "doctor is not found"
      redirect_to new_doctor_registration_path
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
