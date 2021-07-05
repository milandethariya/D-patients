ActiveAdmin.register Doctor do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :medical_speciality, :profile_image, :is_approve, :is_reject
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :medical_speciality, :profile_image, :is_approve, :is_reject]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :email
    column :name
    column :medical_speciality
    column :profile_image
    column :created_at
    column :updateds_at
    column :is_approve
    column :is_reject
    actions do |doctor|
      a "approve", href: admin_approve_path(doctor)
      a "reject", href: admin_reject_path(doctor)
    end
    # column :sign_in_count
    

    # actions
  end
  
  controller do
    # This code is evaluated within the controller class

    def approve
      doctor = Doctor.find_by(id: params[:id])
      doctor.update(is_approve: true, is_reject: false)
      redirect_to admin_doctors_path
    end

    def reject
      doctor = Doctor.find_by(id: params[:id])
      doctor.update(is_reject: true, is_approve: false)
      redirect_to admin_doctors_path
    end
  end
end
