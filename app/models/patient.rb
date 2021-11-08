class Patient < ActiveRecord::Base
  has_many :prescriptions
  has_many :doctors, through: :prescriptions

  def print_patient_info
    puts "Patient:"
    puts "#{self.firstname} #{self.lastname}"
    puts "DOB:"
    puts self.dob
    puts "Address:"
    puts self.address
  end

  def update_address(new_address)
    self.update(address: new_address)
  end

  def received_medicine?(medicine_name)
    self.prescriptions.any? {|prescription| prescription.description == medicine_name}
  end

  def average_cost
    total = self.prescriptions.sum {|prescription| prescription.totalcost}
    (total / self.prescriptions.length).round(2)
  end
end
