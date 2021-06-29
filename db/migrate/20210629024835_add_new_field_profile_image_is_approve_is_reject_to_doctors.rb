class AddNewFieldProfileImageIsApproveIsRejectToDoctors < ActiveRecord::Migration[5.2]
  def change
  	add_column :doctors, :profile_image, :string
  	add_column :doctors, :is_approve, :boolean
  	add_column :doctors, :is_reject, :boolean
  end
end
