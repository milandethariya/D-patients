class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  MEDICAL_SPECIALITY = {'neurology' => 'Neurology', 'orthopedics' => 'Orthopedics','oncology' => 'Oncology'};
  mount_uploader :profile_image, ProfileImageUploader
end
