ActiveAdmin.register Appoinment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :doctor_id, :patient_id, :appoinment_date, :start_time, :end_time, :is_approve, :is_reject
  #
  # or
  #
  # permit_params do
  #   permitted = [:doctor_id, :patient_id, :appoinment_date, :start_time, :end_time, :is_approve, :is_reject]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :doctor
    column :patient
    column :appoinment_date
    column :start_time
    column :end_time
    column :is_approve
    column :is_reject
    actions do |appoinment|
      a "Approve", href: admin_appoinment_approve_reject_path(appoinment, type: "approve")
      a "Reject", href: admin_appoinment_approve_reject_path(appoinment, type: "reject")
    end
    # column :sign_in_count

    #actions
  end

  controller do
    def approve_reject
      appoinment = Appoinment.find_by(id: params[:id])
      doctor = appoinment.doctor
      patient = appoinment.patient
      if params[:type] == "approve"
        appoinment.update(is_approve: true, is_reject: false)
        doctor.notifications << Notification.new(content: "your appoinment with #{patient.name} appoinment date #{appoinment.appoinment_date} at #{appoinment.start_time.strftime("%H:%M")} to #{appoinment.end_time.strftime("%H:%M")} is Approve by Admin")
        patient.notifications << Notification.new(content: "your appoinment with #{doctor.name} appoinment date #{appoinment.appoinment_date} at #{appoinment.start_time.strftime("%H:%M")} to #{appoinment.end_time.strftime("%H:%M")} is Approve by Admin")
      elsif params[:type] == "reject"
        appoinment.update(is_reject: true, is_approve: false)
        doctor.notifications << Notification.new(content: "your appoinment with #{patient.name} appoinment date #{appoinment.appoinment_date} at #{appoinment.start_time.strftime("%H:%M")} to #{appoinment.end_time.strftime("%H:%M")} is Reject by Admin")
        patient.notifications << Notification.new(content: "your appoinment with #{doctor.name} appoinment date #{appoinment.appoinment_date} at #{appoinment.start_time.strftime("%H:%M")} to #{appoinment.end_time.strftime("%H:%M")} is Reject by Admin")
      end
      redirect_to admin_appoinments_path
    end
  end
end
