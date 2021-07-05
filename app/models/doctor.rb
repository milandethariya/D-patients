class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :appoinments, dependent: :destroy
  has_many :doctortimeslots, dependent: :destroy
  has_many :patients, through: :appoinments
  has_many :notifications, as: :notifyable, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :medical_speciality, presence: true

  MEDICAL_SPECIALITY = {'neurology' => 'Neurology', 'orthopedics' => 'Orthopedics','oncology' => 'Oncology'};

  mount_uploader :profile_image, ProfileImageUploader
end
