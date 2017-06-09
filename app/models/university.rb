class University < ApplicationRecord
  has_many :students
  validates_format_of :zip,
   :with => /\A\d{5}(-\d{4})?\z/,
   :message => "Must be in the form 12345 or 12345-1234"
  validates_presence_of :name, :message => "Must contain a name"
  validates_presence_of :city, :message => "Must be located in a city"
end
