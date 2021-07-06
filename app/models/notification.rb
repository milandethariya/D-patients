class Notification < ApplicationRecord
  belongs_to :notifyable, polymorphic: true
  
  default_scope -> { order(created_at: :desc) }

end
