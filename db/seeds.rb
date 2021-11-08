Prescription.destroy_all
Doctor.destroy_all
Patient.destroy_all

puts "👨‍⚕️ Creating doctors..."
 # Your seed code here #
 # In order to have good data for your testing... #
 # ...make sure you add at least one doctor with a salary over 300K#
# doctor1 = Doctor.create(firstname: "Robert", lastname: "Tam", address: "267 NW 34 ave", phonenumber: 3)
10.times do
  Doctor.create(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    dob: Faker::Date.between(from: '1950-01-01', to: '1980-01-01'),
    address: Faker::Address.street_address,
    phonenumber: Faker::Number.number(digits: 10),
    salary: Faker::Number.between(from: 100000, to: 1000000)
  )
end


puts "🤒 Creating patients..."
 # Your seed code here #
 10.times do
  Patient.create(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    dob: Faker::Date.between(from: '1950-01-01', to: Date.today),
    gender: Faker::Gender.short_binary_type,
    address: Faker::Address.street_address,
    phonenumber: Faker::Number.number(digits: 10),
  )
 end

puts "💊 Creating prescriptions..."
 # Your seed code here #
 # In order to have good data for your testing... #
 # ...make sure you at least one prescription with cost greater than $500#
30.times do
  Prescription.create(
    description: Faker::Lorem.word,
    totalcost: Faker::Number.decimal(l_digits: 3, r_digits: 2),
    patient_id: Patient.all.sample.id,
    doctor_id: Doctor.all.sample.id
  )
end

puts "Seeding done!"
