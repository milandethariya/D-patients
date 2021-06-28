class AddNameToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :name, :string
    add_column :doctors, :degree, :string
  end
end
