class AddColumToDoctortimeslots < ActiveRecord::Migration[5.2]
  def change
    add_column :doctortimeslots, :appoinment_date, :date
  end
end
