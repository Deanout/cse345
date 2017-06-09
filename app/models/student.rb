class Student < ApplicationRecord
  belongs_to :university
  validates :student_id, :uniqueness => {:scope => :university}
end
