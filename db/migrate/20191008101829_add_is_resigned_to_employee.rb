class AddIsResignedToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :is_resigned, :boolean, default: false
  end
end
