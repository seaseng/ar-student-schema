require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
# implement your Student model here

  # validates :first_name, :last_name, :birthday, :gender, :email, :phone
  validates :email, :format => { :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/, :message => "Invalid Email" }
  validates :email, :uniqueness => true
  validate :is_toddler
  validates :phone, :format => { :with => /\d{3}-\d{3}-\d{4}/, :message => "Invalid Phone"}

  def is_toddler
    errors.add(:birthday, 'must be a valid datetime') unless self.age > 5 
  end

  def email
    self[:email]
  end

  def phone
    self[:phone]
  end

  def gender
    self[:phone]    
  end

  def birthday
    self[:birthday]
  end

  def name
   self[:name]
  end

  def age
    now = DateTime.now.to_date
    now.year - self[:birthday].year - ((now.month > self[:birthday].month || (now.month == self[:birthday].month && now.day >= self[:birthday].day)) ? 0 : 1)
  end

end
