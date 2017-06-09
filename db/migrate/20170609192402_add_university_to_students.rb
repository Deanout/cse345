class AddUniversityToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :university_id, :integer
  end
end
