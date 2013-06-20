require_relative '../config'

class AddTeacherIdToStudents < ActiveRecord::Migration
  def change
    # add_column :students, :name, :string

    add_column :students,:teacher_id, :integer

    # remove_column :students, :first_name
    # remove_column :students, :last_name
  end
end
