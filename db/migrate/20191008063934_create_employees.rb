class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.decimal :salary, precision: 10, scale: 2
      t.float :rating
      t.integer :role_id

      t.timestamps
    end
  end
end
