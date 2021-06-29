# frozen_string_literal: true

class Doctors::RegistrationsController < Devise::RegistrationsController
  #before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    #super
    @doctor = Doctor.new(doctor_params)
    if params[:doctor][:password] == params[:doctor][:password_confirmation]
      respond_to do |format|
        if @doctor.save
          flash[:success] = "User was successfully created."
          format.html { redirect_to new_doctor_session_path }
          #format.json { render :show, status: :created, location: @user }
        else
          flash.now[:notice] = "unprocessable_entity"
          format.html { render 'doctors/registrations/new'} 
          #format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = "password & conform_password not match"
      render 'doctors/registrations/new'   
    end
    #redirect_to staticpage_bye_path
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_sign_up_params
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:medical_speciality,:profile_image, :email, :password])
  #end

  #If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:medical_speciality,:profile_image])
  end

  def doctor_params
    params.require(:doctor).permit(:name,:email,:medical_speciality,:profile_image, :password, :conform_password)
  end

  # The path used after sign up.
  #def after_sign_up_path_for(resource)
    #super(resource)
    #redirect_to staticpage_bye_path
  #end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
