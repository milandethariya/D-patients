class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :appoinments
  has_many :patients, through: :appoinments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :medical_speciality, presence: true
  MEDICAL_SPECIALITY = {'neurology' => 'Neurology', 'orthopedics' => 'Orthopedics','oncology' => 'Oncology'};
  mount_uploader :profile_image, ProfileImageUploader
end
