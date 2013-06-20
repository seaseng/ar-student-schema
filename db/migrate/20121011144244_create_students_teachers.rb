require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudentsTeachers < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table

    remove_column :students, :teacher_id

    create_table  :students_teachers do |t|
      t.integer    :teacher_id
      t.integer    :student_id
    end
    
  end
end
