class AddColumnToPatients < ActiveRecord::Migration[5.2]
  def change
  	add_column :patients, :name, :string
  	add_column :patients, :age, :integer
  	add_column :patients, :patient_profile_image, :string
  end
end
