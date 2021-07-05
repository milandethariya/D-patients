class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :content
      t.references :notifyable, polymorphic: true

      t.timestamps
    end
    # add_index :notifications, [:notificationable_type,:notificationable_id], name: "notificationable index"
  end
end
