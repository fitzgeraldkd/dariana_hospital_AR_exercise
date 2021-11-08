class Prescription < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  def self.cost_over_500
    self.all.filter {|prescription| prescription.totalcost > 500}
  end

  def self.were_prescribed_by_gender(medicine_name, gender)
    self.all.filter do |prescription|
      prescription.description == medicine_name && Patient.find(prescription.patient_id).gender == gender
    end.map do |prescription|
      Patient.find(prescription.patient_id)
    end.uniq
  end
end