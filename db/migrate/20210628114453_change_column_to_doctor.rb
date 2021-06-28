class ChangeColumnToDoctor < ActiveRecord::Migration[5.2]
  def change
  	rename_column :doctors, :degree, :medical_speciality
  end
end
