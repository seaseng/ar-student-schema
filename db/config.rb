require 'active_record'
require_relative '../app/models/teacher.rb'
require_relative '../app/models/student.rb'
require_relative '../app/models/students_teachers.rb'
require 'Faker'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/../db/ar-students.sqlite3")
