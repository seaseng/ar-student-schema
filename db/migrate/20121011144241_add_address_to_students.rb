class AddAddressToStudents < ActiveRecord::Migration
  def change
    add_column :students, :address, :string

    Student.update_all :address => 'Our Test Address'

  end
end
