class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :appoinments, dependent: :destroy
  validates :name, presence: true
  validates :age, presence: true
  has_many :doctors, through: :appoinments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 	mount_uploader :patient_profile_image, ProfileImageUploader
end
