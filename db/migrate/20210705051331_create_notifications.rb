class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :content
      t.references :notifyable, polymorphic: true

      t.timestamps
    end
  end
end
