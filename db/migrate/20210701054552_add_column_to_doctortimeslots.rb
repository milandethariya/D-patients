class AddColumnToDoctortimeslots < ActiveRecord::Migration[5.2]
  def change
    add_column :doctortimeslots, :time_slot, :integer
  end
end
