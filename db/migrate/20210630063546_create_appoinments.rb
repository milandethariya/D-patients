class CreateAppoinments < ActiveRecord::Migration[5.2]
  def change
    create_table :appoinments do |t|
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true
      t.date :appoinment_date
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
    add_index :appoinments, [:doctor_id, :patient_id, :appoinment_date, :start_time, :end_time], unique: true, name: "appoinments_index_with_patient"
  end
end
