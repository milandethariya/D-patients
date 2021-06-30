class AddColumnToAppoinments < ActiveRecord::Migration[5.2]
  def change
    add_column :appoinments, :is_approve, :boolean
    add_column :appoinments, :is_reject, :boolean
  end
end
