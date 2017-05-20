class AddStudentIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :student_id, :integer
    add_index :users, :student_id, unique: true
  end
end
