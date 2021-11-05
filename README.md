# Phase 3 Active Record Practice Exercise: Hospital

For this assignment, we'll be working with a hospital domain.

*IGNORE THIS SECTION UNTIL YOU GET TO STAGE 2 (going over AR Associations material)*
We have four models: `Patient`, `Doctor`, `Prescription`

For our purposes, a `Patient` can has many `Prescription`s.
A `Doctor` can has many `Prescriptions`.
A `Prescription` 
belongs to a `Patient` and a prescribing `Doctor`.
`Patient` - `Doctor` is a many to many relationship.

**Note**: You should draw your domain on paper or on a whiteboard _before you
start coding_. Remember to identify a single source of truth for your data.
*END OF THE SECTION*

## Learning Goals

Stage 1 (Complete before learning Active Record Associations)
- Active record migrations
- Write class and instance methods using Active Record
- Use Active Record to query the database

Stage 2 (Complete only after you learn Active Record Associations)
- Everything from Stage 1 plus,
- Write Active Record associations
- Write class and instance methods that rely on Active Record Associations

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed
in a suggested order, but you can feel free to tackle the ones you think are
easiest. Be careful: some of the later methods rely on earlier ones.

**Remember!** This exercise does not have tests. You cannot run `rspec`
and you cannot run `learn`. You'll need to create your own sample instances so
that you can try out your code on your own. Make sure your associations and
methods work in the console before submitting.

We've provided you with a tool that you can use to test your code. To use it,
run `rake console` from the command line. This will start a `pry` session with
your classes defined. You can test out the methods that you write here. You are
also encouraged to use the `seeds.rb` file to create sample data to test your
models and associations.

## Deliverables

Write the following methods in the classes in the files provided. Feel free to
build out any helper methods if needed.

Deliverables use the notation `#` for instance methods, and `.` for class
methods.

Remember: Active Record give your classes access to a lot of methods already!
Keep in mind what methods Active Record gives you access to on each of your
classes when you're approaching the deliverables below.

### Migrations

Before working on the rest of the deliverables, you will need to create migrations for all the tables.

- A `Patient` has a first name, last name, DOB, gender ('F', 'M'), address and phone number.
- A `Doctor` has a first name, last name, DOB, address, phone number and a salary.
- An `Prescription` belongs to a `Patient` and to an attending `Doctor` (create any columns 
  will need to establish these relationships using the right foreign keys) and also has:
  - a description and a total_cost columns. Note: the description should be the 
  name of the medicine (i.e. Vicodin, Metformin, Advil, etc.)

After creating the tables using migrations, use the `seeds.rb` file to
create instances of your fours classes so you can test your code.

**Once you've set up your tables**, create some seed data (you need it so you can test your code) and work on building out the following deliverables.

### (Only in Stage 2) Object Association Methods

Use Active Record association macros and Active Record query methods where
appropriate (i.e. `has_many`, `has_many through`, and `belongs_to`).

#### Prescription

- `Prescription#patient`
  - returns the `Patient` instance for this prescription
- `Prescription#doctor`
  - returns the `Doctor` instance for this prescription

#### Patient

- `Patient#prescriptions`
  - returns a collection of all the prescriptions that the Patient has been prescribed

#### Doctor

- `Doctor#prescriptions`
  - returns a collection of all the prescriptions that the Doctor has prescribed

Use `rake console` and check that these methods work before proceeding. For
example, you should be able to call `Doctor.first.prescriptions` and see a list of the
appointments for the first doctor in the database based on your seed data; and
`Prescriptions.first.doctor` should return the doctor for the first prescription in the database.

### Aggregate and Association Methods

#### Patient

- `Patient#print_patient_info` (Stage 1)
  - should return a string formatted as follows:
    Patient:
    {patient full name}
    DOB:
    {patient DOB}
    Address:
    {patient address}

- `Patient#update_address(new_address)` (Stage 1)
  - should update the address for the patient.

- `Patient#received_medicine?(medicine_name)` (Stage 2)
  - accepts an `medicine_name` (string) and returns true if any of the prescriptions
    associated with the patient has that `medicine_name`, otherwise returns false

- `Patient#average_cost` (Stage 2)
  - returns a `float` representing the average cost for all prescriptions for this patient.

#### Doctor

- `Doctor#write_prescription(patient, date, description, total_cost)` (Stage 1)
  - takes a `patient` (an instance of the `Patient` class), a `description` and a `total_cost`
    as arguments, and creates a new `Prescription` instance associated with this doctor 
    and the given patient.

- `Doctor.lowest_salary` (Stage 1)
  - returns the lowest salary among doctors.

- `Doctor.doctor_lowest_salary` (Stage 2)
  - returns the `Doctor` instance with the lowest salary.

- `Doctor.over_300K` (Stage 2)
  - returns the number of doctors that have salaries over 300K formatted as follows:
    `There are currently {insert the count here} doctor(s) earning more than 300K`

- `Doctor#remove_prescriptions(patient)` (Stage 2)
  - takes a `Patient` instance and remove all prescriptions for that patient that were prescribed by this doctor

#### Prescription

- `Prescription.cost_over_500` (Stage 1)
  - returns the prescriptions with total cost greater than $500 

- `Prescription.were_prescribed_by_gender(medicine_name, gender)` (Stage 2)
  - accepts a `medicine_name` and a  `gender` and returns an array of all `Patient` instances of the  given gender that were prescribed that medicine.
