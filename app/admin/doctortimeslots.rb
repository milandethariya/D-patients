ActiveAdmin.register Doctortimeslot do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :doctor_id, :start_time, :end_time, :appoinment_date, :time_slot
  #
  # or
  #
  # permit_params do
  #   permitted = [:doctor_id, :start_time, :end_time, :appoinment_date, :time_slot]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :doctor
    column :appoinment_date
    column :start_time
    column :end_time
    column :time_slot
    # column :sign_in_count

    actions
  end
end
