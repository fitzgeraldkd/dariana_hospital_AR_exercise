class Doctor < ActiveRecord::Base
  has_many :prescriptions
  has_many :patients, through: :prescriptions

  def write_prescription(patient, date, description, total_cost)
    Prescription.create(
      description: description,
      totalcost: total_cost,
      patient_id: patient.id,
      doctor_id: self.id
    )
  end

  def self.doctor_lowest_salary
    self.all.min {|a, b| a.salary <=> b.salary }
  end

  def self.lowest_salary
    self.doctor_lowest_salary.salary
  end

  def self.over_300K
    doctors = self.all.filter {|doctor| doctor.salary > 300000 }
    "There are currently #{doctors.length} doctor(s) earning more than 300K"
  end

  def remove_prescriptions(patient)
    self.prescriptions.each do |prescription|
      prescription.destroy if prescription.patient_id == patient.id
    end
  end
end
