require 'rake'
require 'rspec/core/rake_task'
require_relative 'db/config'
require_relative 'lib/students_importer'


desc "create the database"
task "db:create" do
  touch 'db/ar-students.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-students.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the test database with sample data"
task "db:populate" do
  StudentsImporter.import
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc 'Teacher Data'
task "db:seed_teacher" do
  9.times do
    teacher = Teacher.new
    until teacher.valid?
    teacher = Teacher.new(:name => Faker::Name.first_name,
                     :email => Faker::Internet.email,
                     :phone => Faker::PhoneNumber.phone_number,
                     :address => Faker::Address.street_address)
    end
    teacher.save

  end
end

desc 'Map Students'
task "db:assign_student" do
  ids1 = Teacher.pluck(:id)
  ids2 = Student.pluck(:id)

  100.times do
    StudentTeacher.create(teacher_id: ids1.sample, student_id: ids2.sample)
  end
end

desc 'Driver Code'
task "db:driver" do
student = Student.find(28)
teacher = Teacher.find(15)

p "Student"
p student
puts
p "Teachers for this student"
p student.teachers

p "TEacher"
p teacher
puts
p "Studetns for this teacher"
p teacher.students
end



desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs
