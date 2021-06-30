class Appoinment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  validates :appoinment_date, presence: true
end
