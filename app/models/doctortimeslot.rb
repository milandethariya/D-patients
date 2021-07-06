class Doctortimeslot < ApplicationRecord
  belongs_to :doctor, dependent: :destroy

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :appoinment_date, presence: true
  validates :time_slot, presence: true

  default_scope -> { order(created_at: :desc) }
end
