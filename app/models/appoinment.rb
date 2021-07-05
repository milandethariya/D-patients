class Appoinment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :appoinment_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  
  default_scope -> { order(created_at: :desc) }
end
