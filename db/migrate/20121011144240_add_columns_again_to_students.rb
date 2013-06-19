class AddColumnsAgainToStudents < ActiveRecord::Migration
  def change
    add_column :students, :name, :string

    Student.all.each do |student|
      student.update_attributes(name: student.name)
    end
    remove_column :students, :first_name
    remove_column :students, :last_name
  end
end
