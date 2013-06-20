require_relative '../../db/config'
require 'date'

class Teacher < ActiveRecord::Base

validates :name,:email, :uniqueness => true
validates :name,:email, :phone, :presence => true

has_and_belongs_to_many :students
end
