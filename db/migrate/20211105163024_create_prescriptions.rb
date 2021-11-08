class CreatePrescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :prescriptions do |t|
      t.string :description
      t.float :totalcost
      t.integer :patient_id
      t.integer :doctor_id
    end
  end
end
