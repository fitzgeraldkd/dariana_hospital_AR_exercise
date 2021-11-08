class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.string :gender
      t.string :address
      t.integer :phonenumber
      t.timestamps
    end
  end
end
