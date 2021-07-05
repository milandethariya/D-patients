class Notification < ApplicationRecord
  belongs_to :notifyable, polymorphic: true
end
