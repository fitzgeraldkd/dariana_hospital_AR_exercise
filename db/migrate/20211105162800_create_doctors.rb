class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.string :address
      t.integer :phonenumber
      t.integer :salary
      t.timestamps
    end
  end
end
